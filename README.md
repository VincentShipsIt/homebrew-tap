# Homebrew Tap

Homebrew formulae and casks for [Vincent's](https://github.com/VincentShipsIt) open-source apps.

## Installation

```bash
brew tap vincentshipsit/tap
```

Then install any app below.

## Apps

### MacSweep (cask + formula)

CLI-first macOS system cleaner — scan, clean, maintenance, malware, brew.

MacSweep ships as a desktop app cask plus a CLI formula built from source.
Recent Homebrew gates third-party formulae behind a trust check, so trust the
formula before installing the full desktop app:

```bash
brew trust --formula vincentshipsit/tap/macsweep   # required for 3rd-party formulae
brew install --cask vincentshipsit/tap/macsweep     # installs GUI + CLI
```

CLI only:

```bash
brew install --formula vincentshipsit/tap/macsweep
brew install --formula --HEAD vincentshipsit/tap/macsweep
```

Update / remove:

```bash
brew upgrade --cask vincentshipsit/tap/macsweep
brew upgrade --formula vincentshipsit/tap/macsweep
brew uninstall --cask vincentshipsit/tap/macsweep
brew uninstall --formula vincentshipsit/tap/macsweep
```

Homepage: https://github.com/VincentShipsIt/macsweep

### MeterBar (cask)

Track AI coding assistant usage limits from the macOS menu bar.

```bash
brew install --cask vincentshipsit/tap/meterbar
brew upgrade --cask vincentshipsit/tap/meterbar
brew uninstall --cask vincentshipsit/tap/meterbar
```

To remove app data:

```bash
brew uninstall --cask --zap vincentshipsit/tap/meterbar
```

Homepage: https://github.com/VincentShipsIt/meterbar.app
