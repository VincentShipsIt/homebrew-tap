cask "macsweep" do
  version "1.2.0"
  sha256 "b89d6bdd77792abf1c15fcf7d415cee2d8354e032e9bc335170fa10021e50a45"

  url "https://github.com/VincentShipsIt/macsweep.dev/releases/download/v#{version}/macsweep-v#{version}-macos.zip"
  name "MacSweep"
  desc "Native system cleaner"
  homepage "https://macsweep.dev/"
  auto_updates true

  depends_on formula: "vincentshipsit/tap/macsweep"
  depends_on macos: :tahoe

  app "MacSweep.app"
  binary "#{HOMEBREW_PREFIX}/opt/macsweep/bin/macsweep", target: "macsweep"
end
