class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.92/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "5117ce7189f4e4d98b99f88cd22de15443c12d77afc5c6d4c03d03369620c8ba"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.92/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "63eea980a2f7c9c5386f771b083518436d503c901c841ea9910bc65562b7ec16"
  end
  version "0.1.92"
  license "MIT OR Apache-2.0"
  
  depends_on "libcue"

  def install
    bin.install "axolotlsay"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
