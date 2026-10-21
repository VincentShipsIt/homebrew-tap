cask "macsweep" do
  version "1.1.4"
  sha256 "53d02f34fd5c147d9ba8ed42fbf206721aa86685cb5333f3d5486d01948917cb"

  url "https://github.com/VincentShipsIt/macsweep.dev/releases/download/v#{version}/macsweep-v#{version}-macos.zip",
      verified: "github.com/VincentShipsIt/macsweep.dev/"
  name "MacSweep"
  desc "Native system cleaner"
  homepage "https://macsweep.dev/"
  auto_updates true

  depends_on formula: "vincentshipsit/tap/macsweep"
  depends_on macos: :tahoe

  app "MacSweep.app"
  binary "#{HOMEBREW_PREFIX}/opt/macsweep/bin/macsweep", target: "macsweep"
end
