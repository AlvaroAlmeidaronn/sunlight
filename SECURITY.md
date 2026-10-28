# Security

Sunlight runs a small add-on inside the Dock and a helper as root, and live windows need part of System
Integrity Protection turned off. A security problem in it matters, so please report one privately.

## Reporting

Use **Security › Report a vulnerability** on this repository (GitHub's private reporting), or email
d@spacefarm.digital. Please don't open a public issue. Include what you found, how to reproduce it, and the
Sunlight and macOS versions. You'll get an answer within a few days, and credit in the release notes if
you'd like it.

## What's in scope

- The helper (`LiveWindows/helper.m`): who may ask it to do what as root, and its background daemon.
- The Dock add-on and its socket (`LiveWindows/osax/`): what another process on the Mac can make the Dock
  do through it.
- The password rule older builds and ad-hoc builds install, and anything else that touches
  `/Library/ScriptingAdditions`, `/private/etc/sudoers.d` or NVRAM.
- Updates (Sparkle): anything that would let an unsigned or tampered update install.

Turning SIP partly off is a documented trade-off of live windows, not a vulnerability in itself; the
wizard's "Why SIP goes partly off" page says what stays on and what it costs.

## Supported versions

Only the latest release gets fixes.
