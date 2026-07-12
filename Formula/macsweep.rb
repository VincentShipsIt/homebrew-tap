# MacSweep — CLI-first macOS system cleaner.
#
# Distribution strategy: build the `macsweep` CLI from source via SwiftPM.
# The separately published cask installs the Developer ID-signed and notarized
# MacSweep app. The Swift package lives in the `MacSweep/` subdirectory of the
# source repo, so the install block builds from there.
#
# Install (this formula lives in the VincentShipsIt/homebrew-tap repo):
#   brew tap vincentshipsit/tap
#   brew trust --formula vincentshipsit/tap/macsweep # required on recent Homebrew (3rd-party tap)
#   brew install --formula vincentshipsit/tap/macsweep
#   brew install --formula --HEAD vincentshipsit/tap/macsweep
#
# Recent Homebrew gates non-official taps behind a trust check; without the
# `brew trust` line above the install aborts with "tap trust is required".
#
# RELEASE CHECKLIST — when cutting the next tag (vX.Y.Z) in the macsweep repo:
# bump MacSweepVersion.current / MARKETING_VERSION to match, push the tag, then
# update the `url` + `sha256` below (compute with `brew fetch` or
# `shasum -a 256 <archive>.tar.gz`). Homebrew derives `version` from the tag in
# the url, so no explicit `version` line is needed.
class Macsweep < Formula
  desc "CLI-first macOS system cleaner (scan, clean, maintenance, malware, brew)"
  homepage "https://macsweep.dev/"
  url "https://github.com/VincentShipsIt/macsweep/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "424c44fed8d3b792b90716bd51211b831ee3201353f187a4ebfd534d7cf72890"
  license "MIT"
  head "https://github.com/VincentShipsIt/macsweep.git", branch: "master"

  depends_on macos: :tahoe # macOS 26+ (matches Package.swift .macOS(.v26))

  def install
    # The SwiftPM package root is the `MacSweep/` subdirectory, not the repo
    # root. Build the release CLI product there, then install the binary.
    # `--disable-sandbox` is required: Homebrew's build sandbox blocks SwiftPM's
    # own network/cache access during dependency resolution.
    cd "MacSweep" do
      system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "macsweep"
      bin.install ".build/release/macsweep"
    end
  end

  test do
    # `macsweep version` prints "macsweep <semver>" to stdout and exits 0.
    output = shell_output("#{bin}/macsweep version")
    assert_match(/^macsweep \d+\.\d+\.\d+$/, output)
  end
end
