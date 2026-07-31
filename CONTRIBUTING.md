# Contributing

Thank you for helping Understory grow.

## Palette changes

The canonical palette is `palette.json`. Changes to a core value should include:

- the visual or accessibility problem being solved;
- affected semantic roles and downstream ports;
- before/after contrast measurements for relevant text pairs;
- synchronized updates to every format under `src/`, `terminal/`, and `swatches/`.

Core colors follow semantic versioning because changing a value changes every
downstream theme.

## New formats and ports

Format additions belong here when they express the palette itself. Complete
application themes should generally be separate repositories so they can have
their own releases, documentation, and maintainers.

Good ports preserve native application hierarchy, use the smallest useful
subset of colors, and document any deliberate deviations.

## Pull requests

Keep commits focused, describe the design reasoning, and run
`scripts/check-palette.sh` before submitting.
