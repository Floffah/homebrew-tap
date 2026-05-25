# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Culprit < Formula
  desc "Clean unnecessary large files from your mac, extendable cli tool for generating a tailored cleanup script"
  homepage "https://github.com/Floffah/culprit"
  url "https://github.com/Floffah/culprit/archive/refs/tags/v0.0.1-beta.1.tar.gz"
  sha256 "8013b17434583615dadfcc934db39ee08e1dc35485cb5a8dfd17c82e76e2ec09"
  license "MIT"

  depends_on "go" => :build

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"culprit", "cmds/culprit/culprit.go"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test culprit`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system bin/"culprit", "--help"
  end
end
