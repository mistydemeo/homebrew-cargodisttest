class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.98/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "963d990800e98bf574030a7b763cd0b3ac34b2613191ecf4c02c185f09b09fbf"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.98/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "8ff2ecf5b93f251a594e169bbaa292462204dc43b7aa5f35a936b1d2c5099fe2"
  end
  version "0.1.98"
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
