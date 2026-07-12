cask "macsweep" do
  version "1.1.1"
  sha256 "84b51059e06a6e60eca911da743ba389cd49aa0029aa1a5b22d302039a4faaf1"

  url "https://github.com/VincentShipsIt/macsweep/releases/download/v#{version}/macsweep-v#{version}-macos.zip",
      verified: "github.com/VincentShipsIt/macsweep/"
  name "MacSweep"
  desc "Native system cleaner"
  homepage "https://macsweep.dev/"

  depends_on formula: "vincentshipsit/tap/macsweep"
  depends_on macos: :tahoe

  app "MacSweep.app"
  binary "#{HOMEBREW_PREFIX}/opt/macsweep/bin/macsweep", target: "macsweep"
end
