class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.50/axolotlsay-x86_64-apple-darwin.tar.gz"
  sha256 "7e25ebfe783e601b965a46087bd493439cba2c3a7016e2441f64e6933eaae0c1"
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
