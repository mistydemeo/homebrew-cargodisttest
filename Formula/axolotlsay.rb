class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.42/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "64858ee6b54d8fcda76ea49977ce372fbaf02aa95cf1f541126276af72453ba0"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.42/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "ab11d8aef557702fab017cf300901884f681be4ab90c0e667fc687fa5a3cf817"
  end
  version "0.2.42"
  license "MIT OR Apache-2.0"
  
  depends_on ""
  depends_on ""

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
