cask "macsweep" do
  version "1.0.7"
  sha256 "42fa141c912d11aa308e5ac5cb3e244dbc7829f43be2734a9252bdb8ea47f263"

  url "https://github.com/VincentShipsIt/macsweep/releases/download/v#{version}/macsweep-v#{version}-macos.zip",
      verified: "github.com/VincentShipsIt/macsweep/"
  name "MacSweep"
  desc "Native macOS system cleaner"
  homepage "https://github.com/VincentShipsIt/macsweep"

  depends_on formula: "vincentshipsit/tap/macsweep"
  depends_on macos: ">= :tahoe"

  app "MacSweep.app"
end
