# The DMG window

What people see when they open `Sunlight-<version>.dmg`: a Finder window, 660 × 420 points, with the hill
photo, Sunlight on the left, an Applications shortcut on the right, and an arrow between them.

- `hill.jpg`: the photo, cropped to the window at 2x with the crest at 84 % of the height, so both icons
  and their labels sit on the sky (the left 3385 × 2154 of the 7229 × 4822 original, scaled down). Zongnan Bao on
  Unsplash (https://unsplash.com/photos/DznqzDPA0WM), under the Unsplash licence.
- `background.png`, `background@2x.png`: the rendered background, from `make dmg-background`
  (`scripts/make-dmg-background.swift`: the photo and the arrow). The two go into one HiDPI TIFF on the disk
  image, so the window is crisp on Retina displays.

`scripts/dmg-stage.sh` puts these together with the app, and `scripts/make-dmg-layout.swift` writes the
window layout (size, icon view at 128 px, the background, the icon positions) as `.DS_Store` onto the
mounted image, both run by `scripts/package.sh`.
