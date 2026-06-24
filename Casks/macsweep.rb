cask "macsweep" do
  version "1.0.6"
  sha256 "3b3f474fc06fd93f5a52d69adc4e5df7b36b20abb19315d9eb6cd3ddbd281698"

  url "https://github.com/VincentShipsIt/macsweep/releases/download/v#{version}/macsweep-v#{version}-macos.zip",
      verified: "github.com/VincentShipsIt/macsweep/"
  name "MacSweep"
  desc "Native macOS system cleaner"
  homepage "https://github.com/VincentShipsIt/macsweep"

  depends_on formula: "vincentshipsit/tap/macsweep"
  depends_on macos: ">= :tahoe"

  app "MacSweep.app"
end
