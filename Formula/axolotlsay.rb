class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.71"
  on_macos do
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.71/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "17e6524954667eadafce43d42515d08ccc12044f53039f5829cc9154af93f6c9"
  end
  on_linux do
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.71/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e78a86cb591785cfc050b54cb0255b596b713f745a3a31aa926f30c7e9c06cbc"
    end
  end
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
