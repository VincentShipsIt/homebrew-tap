cask "macsweep" do
  version "1.1.2"
  sha256 "4a7a25509d988d5461065f1a8db9d35f557ce70ae6bb1fb9fe27f6572ce5e0f8"

  url "https://github.com/VincentShipsIt/macsweep/releases/download/v#{version}/macsweep-v#{version}-macos.zip",
      verified: "github.com/VincentShipsIt/macsweep/"
  name "MacSweep"
  desc "Native system cleaner"
  homepage "https://macsweep.dev/"
  auto_updates true

  depends_on formula: "vincentshipsit/tap/macsweep"
  depends_on macos: :tahoe

  app "MacSweep.app"
  binary "#{HOMEBREW_PREFIX}/opt/macsweep/bin/macsweep", target: "macsweep"
end
