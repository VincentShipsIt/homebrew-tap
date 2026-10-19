cask "meterbar" do
  version "1.9.2"
  sha256 "e8a5aab8e1ac6be59282608390fbc2547e058bb50b37b69b86056419c15c7690"

  url "https://github.com/VincentShipsIt/meterbar.dev/releases/download/v#{version}/MeterBar-v#{version}.zip"
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

  postflight_steps do
    # Remove quarantine for an ad-hoc-signed, unnotarized app.
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/MeterBar.app"],
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
