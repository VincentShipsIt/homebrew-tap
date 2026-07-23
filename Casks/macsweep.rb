cask "macsweep" do
  version "1.1.3"
  sha256 "9d53a52b5d8e1669d173edc45448c32ef88bb879b71f461af1e0903e391ce29e"

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
