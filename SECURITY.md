# Security

## Reporting a vulnerability

Report a suspected vulnerability privately through GitHub's security advisories
for this repository:

<https://github.com/jinxware00/Occlua/security/advisories/new>

Please do not open a public issue or pull request for a security problem, as
that exposes it before there is a fix. A useful report includes what you did,
what you expected, what happened, and the output of `occlua --version`.

You will get an acknowledgement, an assessment of whether it is in scope, and a
note on timing. Please give us a reasonable window to fix an issue before
disclosing it publicly.

## In scope

- The obfuscator producing output that does not behave like the input, or
  output that is not valid for the chosen target.
- A bug in the installer: a checksum that is not verified, a download that
  writes outside the install directory, or a way to run code outside the
  intended install.
- The licensing service: authentication, key handling, or a way to obtain a
  paid tier without a valid licence.

## Out of scope

- The strength of the obfuscation itself. OccLua raises the cost of reading and
  analysing a script; it does not promise that a determined attacker cannot
  recover anything from a protected file.
- Anything that requires the attacker to already control the user's machine or
  account.

## Licence keys

Treat a licence key as a password. Do not commit it to a repository, paste it
into a public issue, or share it. Use the `OCCLUA_LICENSE_KEY` variable in CI
rather than passing a key on the command line, where it can land in shell
history.

A key that is leaked or shared can be revoked. If you believe a key has been
exposed, report it through the advisory link above and it will be retired.

## Supported versions

Security fixes are applied to the latest released version. There is no
long-term support for older builds.
