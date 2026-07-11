cask "macsweep" do
  version "1.1.0"
  sha256 "9204ecbde4400425d1e6860d159e4d4b9e64a407861f63afa3c5885b5ff8f874"

  url "https://github.com/VincentShipsIt/macsweep/releases/download/v#{version}/macsweep-v#{version}-macos.zip",
      verified: "github.com/VincentShipsIt/macsweep/"
  name "macsweep.dev"
  desc "Native system cleaner"
  homepage "https://macsweep.dev/"

  depends_on formula: "vincentshipsit/tap/macsweep"
  depends_on macos: :tahoe

  app "macsweep.dev.app"
  binary "#{HOMEBREW_PREFIX}/opt/macsweep/bin/macsweep", target: "macsweep"
end
