class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.4/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "ab58fddb878379385b1980b6ea9a79a5819466806c80dc44767529bc0e1f3848"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.4/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "165c5ec807947e9af803b5a3b81adf7a8b0d03835df966d77c4c6d4af427bb30"
  end
  version "0.2.4"
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
