class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.27/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "f044e5c191600c15ad505a1edbf3286566a8e2a1571eb5c4a3259cb78d482b99"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.27/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "8684d30359c2bac1db944f772891b5fc86bb695497bc5f885e0221d3839a10f4"
  end
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