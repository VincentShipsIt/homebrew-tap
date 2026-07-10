cask "meterbar" do
  version "1.6.1"
  sha256 "104487d27d969cd96380bd6854673b834bb9715a2dbe96c7af1731762a1156fd"

  url "https://github.com/VincentShipsIt/meterbar.app/releases/download/v#{version}/MeterBar-v#{version}.zip"
  name "MeterBar"
  desc "Track AI coding assistant usage limits from the menu bar"
  homepage "https://meterbar.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "MeterBar.app"
  binary "#{appdir}/MeterBar.app/Contents/Helpers/meterbar", target: "meterbar"

  postflight do
    # Remove quarantine for an ad-hoc-signed, unnotarized app.
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/MeterBar.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Scripts/dev.shipshit.MeterBar",
    "~/Library/Application Scripts/dev.shipshit.MeterBar.Widget",
    "~/Library/Application Support/MeterBar",
    "~/Library/Caches/dev.shipshit.MeterBar",
    "~/Library/Containers/dev.shipshit.MeterBar",
    "~/Library/Containers/dev.shipshit.MeterBar.Widget",
    "~/Library/Group Containers/group.dev.shipshit.meterbar",
    "~/Library/HTTPStorages/dev.shipshit.MeterBar",
    "~/Library/Preferences/dev.shipshit.MeterBar.plist",
    "~/Library/Saved Application State/dev.shipshit.MeterBar.savedState",
  ]
end
