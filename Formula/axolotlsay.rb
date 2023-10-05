class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.6/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "54b7a4272a46f5c93272955e1ce1d9be1973fafa5629e6ba4c4da60f845465b5"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.6/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "549a672bb6e6a0de574c999d9b589e3b766aed22b96d3f30537680462a70b97f"
  end
  version "0.2.6"
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
