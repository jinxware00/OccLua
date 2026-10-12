#Requires -Version 5.1
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$Distribution = 'jinxware00/OccLua'
$ManifestUrl = "https://github.com/$Distribution/releases/latest/download/releases.json"
$InstallDir = Join-Path $env:USERPROFILE '.occlua\bin'

function Get-Architecture {
    $architecture = $env:PROCESSOR_ARCHITEW6432
    if ([string]::IsNullOrWhiteSpace($architecture)) {
        $architecture = $env:PROCESSOR_ARCHITECTURE
    }

    if ($architecture -eq 'AMD64') { return 'x86_64' }
    if ($architecture -eq 'ARM64') { return 'aarch64' }
    if ($architecture -eq 'x86') { return 'x86' }

    throw ('Unsupported Windows architecture: ' + $architecture)
}

function Add-ToUserPath {
    param([string]$Directory)

    $oldPath = [Environment]::GetEnvironmentVariable('Path', 'User')
    $entries = @()

    if ($oldPath) {
        $entries = @($oldPath -split ';' | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
    }

    $target = $Directory.TrimEnd([char]92)
    foreach ($entry in $entries) {
        $candidate = ([string]$entry).Trim().Trim([char]34).TrimEnd([char]92)
        if ($candidate.Equals($target, [StringComparison]::OrdinalIgnoreCase)) {
            $env:Path = Add-OccLuaPathEntry -Path $env:Path -Directory $Directory
            return
        }
    }

    $newPath = if ($entries.Count -eq 0) { $Directory } else { (@($entries) + @($Directory)) -join ';' }
    [Environment]::SetEnvironmentVariable('Path', $newPath, 'User')
    $env:Path = Add-OccLuaPathEntry -Path $env:Path -Directory $Directory
}

function Add-OccLuaPathEntry {
    param(
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Path,
        [string]$Directory
    )

    $entries = @()
    if ($Path) {
        $entries = @($Path -split ';' | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
    }

    $target = $Directory.TrimEnd([char]92)
    foreach ($entry in $entries) {
        $candidate = ([string]$entry).Trim().Trim([char]34).TrimEnd([char]92)
        if ($candidate.Equals($target, [StringComparison]::OrdinalIgnoreCase)) {
            return $Path
        }
    }

    if ($entries.Count -eq 0) { return $Directory }
    return (@($entries) + @($Directory)) -join ';'
}

if ($env:OS -ne 'Windows_NT') {
    throw 'This installer supports Windows only.'
}

$architecture = Get-Architecture

Write-Host ''
Write-Host '  OccLua installer' -ForegroundColor Cyan
Write-Host ('  Windows / ' + $architecture + ' / PowerShell ' + $PSVersionTable.PSVersion.ToString()) -ForegroundColor DarkCyan
Write-Host ''

$temp = Join-Path ([IO.Path]::GetTempPath()) ('occlua-install-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $temp -Force | Out-Null

$security = [Net.ServicePointManager]::SecurityProtocol
$progress = $ProgressPreference

try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $ProgressPreference = 'SilentlyContinue'

    Write-Host '  [1/4] Fetching the release manifest' -ForegroundColor Cyan
    $manifestPath = Join-Path $temp 'releases.json'
    Invoke-WebRequest -Uri $ManifestUrl -OutFile $manifestPath -UseBasicParsing -ErrorAction Stop

    $manifest = Get-Content -LiteralPath $manifestPath -Raw -Encoding UTF8 | ConvertFrom-Json
    $release = @($manifest.releases) |
        Where-Object { [string]$_.os -eq 'windows' -and [string]$_.architecture -eq $architecture } |
        Select-Object -First 1

    if ($null -eq $release) {
        throw ('No released binary is published for windows ' + $architecture + ' yet.')
    }

    Write-Host ('        release ' + $release.version) -ForegroundColor DarkGray

    $assetName = [IO.Path]::GetFileName(([Uri]([string]$release.url)).AbsolutePath)
    $download = Join-Path $temp $assetName

    Write-Host '  [2/4] Downloading the release' -ForegroundColor Cyan
    Invoke-WebRequest -Uri ([string]$release.url) -OutFile $download -UseBasicParsing -ErrorAction Stop

    $actual = (Get-FileHash -LiteralPath $download -Algorithm SHA256).Hash
    $expected = ([string]$release.sha256).Trim()
    if (-not $actual.Equals($expected, [StringComparison]::OrdinalIgnoreCase)) {
        throw ('SHA-256 verification failed. Expected ' + $expected + ' but received ' + $actual + '.')
    }
    Write-Host '        SHA-256 verified' -ForegroundColor DarkGray
}
finally {
    [Net.ServicePointManager]::SecurityProtocol = $security
    $ProgressPreference = $progress
}

$binary = $download
if ($assetName -match '\.zip$') {
    $extract = Join-Path $temp 'extract'
    Expand-Archive -LiteralPath $download -DestinationPath $extract -Force
    $found = Get-ChildItem -Path $extract -Recurse -Filter 'occlua.exe' | Select-Object -First 1
    if ($null -eq $found) {
        throw 'The release archive did not contain occlua.exe.'
    }
    $binary = $found.FullName
}

Write-Host '  [3/4] Installing occlua.exe' -ForegroundColor Cyan
$version = (& $binary --version 2>&1) -join ' '
Write-Host ('        ' + $version.Trim()) -ForegroundColor DarkGray

New-Item -ItemType Directory -Path $InstallDir -Force | Out-Null
$destination = Join-Path $InstallDir 'occlua.exe'
$staged = Join-Path $InstallDir ('.occlua-new-' + [Guid]::NewGuid().ToString('N') + '.exe')

try {
    Copy-Item -LiteralPath $binary -Destination $staged -Force -ErrorAction Stop
    if (Test-Path -LiteralPath $destination -PathType Leaf) {
        try {
            Remove-Item -LiteralPath $destination -Force -ErrorAction Stop
        }
        catch {
            throw 'The existing occlua.exe is in use. Close OccLua and try again.'
        }
    }
    Move-Item -LiteralPath $staged -Destination $destination -Force -ErrorAction Stop
}
finally {
    if (Test-Path -LiteralPath $staged -PathType Leaf) {
        Remove-Item -LiteralPath $staged -Force -ErrorAction SilentlyContinue
    }
    if (Test-Path -LiteralPath $temp -PathType Container) {
        Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue
    }
}

Write-Host '  [4/4] Updating your PATH' -ForegroundColor Cyan
Add-ToUserPath -Directory $InstallDir

Write-Host ''
Write-Host ('  Installed ' + $version.Trim() + ' to ' + $destination) -ForegroundColor Green
Write-Host '  Open a new terminal, then run: occlua --help' -ForegroundColor White
Write-Host ''
