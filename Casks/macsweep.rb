cask "macsweep" do
  version "1.0.8"
  sha256 "b723f3976d39bab2d5cb4a692965497399897f46d23ed9ccf000899975c994b7"

  url "https://github.com/VincentShipsIt/macsweep/releases/download/v#{version}/macsweep-v#{version}-macos.zip"
  name "MacSweep"
  desc "Native system cleaner"
  homepage "https://macsweep.dev/"

  depends_on formula: "vincentshipsit/tap/macsweep"
  depends_on macos: :tahoe

  app "MacSweep.app"
  binary "#{HOMEBREW_PREFIX}/opt/macsweep/bin/macsweep", target: "macsweep"
end
