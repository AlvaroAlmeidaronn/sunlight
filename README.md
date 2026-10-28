# Sunlight

An infinite, zoomable canvas of your **real Mac windows**. Every window you have open stays on it, live,
where you put it. Zoom out and all of your work is in front of you; click a window and it becomes the real
window at 1:1, with no seam. Desktop widgets and Finder's desktop files sit on the canvas too, and ⌘Tab,
Mission Control and Show Desktop all land on it, so it's still your Mac, with room.

Sunlight is pre-release software for macOS 15 or later on Apple silicon.

## Two ways to run it

- **Preview** needs nothing but Accessibility and Screen Recording granted. Windows on the
  canvas are live pictures captured with ScreenCaptureKit. It's the way to try Sunlight, but heavier and
  less smooth than the real thing.
- **Live windows** show the real windows themselves, scaled by a small add-on Sunlight loads into the Dock.
  That needs part of System Integrity Protection (SIP) turned off, which the setup wizard walks you through,
  Recovery restart included, and **Settings › General › Uninstall Sunlight…** walks back.

Read [LiveWindows/README.md](LiveWindows/README.md) for what the add-on does and why it needs SIP partly off
before you turn it on.

## Install

Download the DMG from the [releases](https://github.com/spacefarm-digital/sunlight-releases/releases), or
with Homebrew:

```
brew install spacefarm-digital/tap/sunlight
```

The first launch opens **Set Up Sunlight**. [INSTALL.md](INSTALL.md) covers every step, checking the setup
and removing it.

## Build from source

```
make run
```

Needs macOS 15 or later and Xcode 16 or later (the command-line tools are enough). `swift test` runs the
tests. The build signs with the first Developer ID Application or Apple Development identity in your
keychain, or ad-hoc with neither; see [INSTALL.md](INSTALL.md#building-from-source) for what each one changes.

## Using it

A few to start with: pinch or ⌥-scroll to zoom, two-finger scroll to pan, click a window to enter it, the Mission Control key (F3)
to go back to the canvas, a four-finger tap to see everything (and again to go back in), ⌘S to save a layout and ⌘1–⌘9 to restore one. Everything
else lives in the sun-rays icon in the menu bar: a small panel with the Sunlight switch, Minimap and your layouts,
and More for the rest. Arranging (Arrange and Tidy) and strip mode are experimental and off until turned on
in Settings › General › Experimental. **Takeover mode** goes further: it hides the Dock and makes
⌘Tab, Mission Control and Show Desktop work on the canvas, and puts every setting it changed back on quit.

The full guide to controls, modes, layouts, backgrounds, takeover mode and how the canvas is drawn is in
[docs/how-it-works.md](docs/how-it-works.md).

## Privacy

Sunlight has no analytics, crash reporting or accounts. The only thing it sends over the network is the
update check (Sparkle fetching the release feed, `packaging/release.conf`). Window pictures, titles and
layouts stay on your Mac, and the Diagnose report leaves window titles and pictures out.

## Known limits

By default there's one canvas, on the main display; windows on the others show where they are. Turn
on Settings › General › Experimental › Multiple displays for a canvas on every display. Live windows on
the other displays need the Dock add-on from sunlight-13 (older ones show pictures there), and saved
layouts and the widget gallery are the main display's. The rest are listed in
[docs/how-it-works.md](docs/how-it-works.md#known-limits).

## Changes

See [CHANGELOG.md](CHANGELOG.md).

## Credits and licence

Sunlight is MIT licensed, see [LICENSE](LICENSE). The Dock add-on and its loader in `LiveWindows/osax` are
adapted from [yabai](https://github.com/koekeishiya/yabai)'s scripting addition (MIT, © 2019 Åsmund
Vikane), by way of the macOS 27 fork at [LCS-Dev-Ergos/yabai](https://github.com/LCS-Dev-Ergos/yabai); see
`LiveWindows/osax/LICENSE-yabai.txt`.
