# Contributing to Sunlight

Thanks for helping. Sunlight is a small project, so a short note first saves everyone time.

## Before you start

- **Bugs:** open an issue with the bug template. Attach the report from **Settings › Live Windows ›
  Diagnose…** (or `Sunlight --diagnose`): it has the Mac's facts, the setup steps and the log's tail, and
  no window titles or pictures.
- **Features and larger changes:** open an issue first and describe what you'd like to change, so we can
  agree on the shape before you write it.
- **Security problems:** don't open an issue; see [SECURITY.md](SECURITY.md).

## Building and testing

See [INSTALL.md › Building from source](INSTALL.md#building-from-source). In short: `make run` to build
and run, `swift test` for the tests. CI runs the build, the tests and the live-windows build on every pull
request.

[docs/how-it-works.md](docs/how-it-works.md) explains how the canvas is drawn, and
[LiveWindows/README.md](LiveWindows/README.md) covers the Dock add-on, its protocol and how to test it.

## Pull requests

- Keep each one to one change, and say in the description what you checked by hand on a real Mac (the
  canvas, entering and leaving windows, live windows if you touched them).
- Add or update tests where the logic can be tested without the window server (layouts, tiling, the
  strip, wire formats and the like are pure and tested already).
- Follow the code around you: its naming, its comment style, and plain-language log lines.
- Changes to `LiveWindows/` run inside the Dock or as root. Keep them small, explain them carefully, and
  expect a slower review.

By contributing you agree that your work is released under the [MIT licence](LICENSE).
