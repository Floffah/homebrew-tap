class Culprit < Formula
  desc "Clean unnecessary large files from your mac, extendable and safe"
  homepage "https://github.com/Floffah/culprit"
  url "https://github.com/Floffah/culprit/archive/refs/tags/v0.0.1-beta.1.tar.gz"
  sha256 "8013b17434583615dadfcc934db39ee08e1dc35485cb5a8dfd17c82e76e2ec09"
  license "MIT"

  bottle do
    root_url "https://github.com/Floffah/homebrew-tap/releases/download/culprit-0.0.1-beta.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4d7a0f2c0f52507faa452129fec411b5dfbdb2e6706b1487a955476b200df0ff"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a21f0721d8cde684834598b2e790a4e8d415fc35b7c609bc463e25e2039937ac"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"culprit", "cmds/culprit/culprit.go"
  end

  test do
    system bin/"culprit", "--help"
  end
end
