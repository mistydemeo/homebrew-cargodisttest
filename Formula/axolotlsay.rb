class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.47/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "4f1ea140877313dcd691bd69d54c5d50f303f241dd36944f0b3c1c358c8354e1"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.47/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "6fa9c96d6aa358b7592eaec90dd9882323e414e2b475fea442b0b1a634074d31"
  end
  version "0.1.47"
  license "MIT OR Apache-2.0"

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
