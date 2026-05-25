class Culprit < Formula
  desc "Clean unnecessary large files from your mac, extendable and safe"
  homepage "https://github.com/Floffah/culprit"
  url "https://github.com/Floffah/culprit/archive/refs/tags/v0.0.1-beta.1.tar.gz"
  sha256 "8013b17434583615dadfcc934db39ee08e1dc35485cb5a8dfd17c82e76e2ec09"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"culprit", "cmds/culprit/culprit.go"
  end

  test do
    system bin/"culprit", "--help"
  end
end
