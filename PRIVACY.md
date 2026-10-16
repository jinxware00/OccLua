# Privacy

What OccLua does with your data. It is a plain description
of the software's behaviour, not legal advice.

## The short version

Basic obfuscation runs entirely on your machine and sends nothing anywhere.
Standard and Enterprise are processed by the OccLua service, so a licensed
build does send your source to that service and gets the protected result back.

## What the CLI sends

- **Free.** No network access. Nothing leaves your machine.
- **Standard and Enterprise.** The CLI sends the script you asked to protect,
  the target, the profile and the seed, together with either your account
  session or a licence key, to the OccLua API. The service returns the
  protected script and a list of which stages ran. The script is processed to
  produce your output; it is not stored after the request completes.
- **Licence checks.** When a key is needed, the CLI sends the key to the
  api to confirm its activity and to read its tier.

## What we store

The service keeps:

- **Accounts.** Your email address, an Argon2 hash of your password, and the times the account was created and last used.
- **Sessions.** A session token per sign-in, with an expiry, so you can stay
  signed in without sending your password again.
- **Licences.** Each key, its tier, its status, the email it was issued to, the
  account it is bound to, and its creation, redemption and expiry times.
- **Purchases.** For a completed checkout: the order id, the email, the
  product, the tier, the quantity, the amount and currency, the payment status,
  and any keys issued. Payments themselves are handled by the store; OccLua
  does not see your card details.

Password hashes and session tokens are stored so that authentication works;
licence and purchase records are stored so that a key can be validated and
supported later.

## Email

Licence keys are delivered by email through an SMTP provider. The service sends
only the message you expect: your tier, the key, and how to redeem it. It does
not use your address for anything else.

## Retention and removal

Account, licence and purchase records are kept while the account exists, so
that a key stays valid and support is possible. There is no self-service delete
yet. If you want your account and its records removed, open an issue in this
repository and they will be deleted.

## What OccLua does not do

OccLua does not sell your data, and the CLI does not include advertising or
third-party analytics.

## Changes

If this behaviour changes, this file is updated with the change.
