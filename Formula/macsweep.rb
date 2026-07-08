# MacSweep — CLI-first macOS system cleaner.
#
# Distribution strategy (no Apple Developer account / code signing yet):
# build the `macsweep` CLI from source via SwiftPM. The Swift package lives in
# the `MacSweep/` subdirectory of the source repo, so the install block builds
# from there.
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
  homepage "https://github.com/VincentShipsIt/macsweep"
  url "https://github.com/VincentShipsIt/macsweep/archive/refs/tags/v1.0.8.tar.gz"
  sha256 "7ee341506f788083d2755ee37af49c21cb65c3bed547f0390c5e81c98f99c80c"
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
