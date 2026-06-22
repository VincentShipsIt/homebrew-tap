# Homebrew Tap

Homebrew formulae and casks for [Vincent's](https://github.com/VincentShipsIt) open-source apps.

## Installation

```bash
brew tap vincentshipsit/tap
```

Then install any app below.

## Apps

### MacSweep (formula, built from source)

CLI-first macOS system cleaner — scan, clean, maintenance, malware, brew.

MacSweep ships as a CLI built from source (no Apple Developer account or code
signing yet). Recent Homebrew gates third-party formulae behind a trust check,
so the install is:

```bash
brew trust --formula vincentshipsit/tap/macsweep   # required for 3rd-party formulae
brew install macsweep                               # pinned stable release
brew install --HEAD macsweep                        # bleeding-edge from master
```

Update / remove:

```bash
brew upgrade macsweep
brew uninstall macsweep
```

Homepage: https://github.com/VincentShipsIt/macsweep

### MeterBar (cask)

Track AI coding assistant usage limits from the macOS menu bar.

```bash
brew install --cask meterbar
brew upgrade --cask meterbar
brew uninstall --cask meterbar
```

To remove app data:

```bash
brew uninstall --cask --zap meterbar
```

Homepage: https://github.com/VincentShipsIt/meterbar.app
