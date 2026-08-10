# Homebrew tap for Mint

Mint is a native, on-device Mac cleanup and file organizer from DZG Studio LLC.

## Install

```bash
brew tap dzg-studio/mint
brew install --cask mint
```

The cask installs `Mint.app` and links the bundled read-only/MCP-capable command-line tool as `mint-cli`.

Mint requires macOS 14 Sonoma or later. The app is signed with a Developer ID certificate, notarized by Apple, and updates through a signed Sparkle feed.

- Website: https://mint.dzgapp.com
- Documentation: https://mint.dzgapp.com/docs
- Releases: https://github.com/dzg-studio/mint-releases/releases

## Updating the cask

For every Mint release:

1. change `version` to the new public version;
2. calculate SHA-256 from the immutable versioned DMG, never the moving `Mint.dmg` alias;
3. run the cask style, audit, and install checks;
4. commit and publish only after the GitHub release is available.

```bash
curl -L --fail --silent --show-error \
  "https://github.com/dzg-studio/mint-releases/releases/download/vVERSION/Mint-VERSION-macOS.dmg" \
  | shasum -a 256
```

The canonical cask source lives in `Casks/mint.rb`.
