cask "macsweep" do
  version "1.0.5"
  sha256 "9af348b70305786bdb3f8ffb7fd3fdceb6e16916c441a9ebb7635218d224563a"

  url "https://github.com/VincentShipsIt/macsweep/releases/download/v#{version}/macsweep-v#{version}-macos.zip",
      verified: "github.com/VincentShipsIt/macsweep/"
  name "MacSweep"
  desc "Native macOS system cleaner"
  homepage "https://github.com/VincentShipsIt/macsweep"

  depends_on formula: "vincentshipsit/tap/macsweep"
  depends_on macos: ">= :tahoe"

  app "MacSweep.app"
end
