class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.72"
  on_macos do
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.72/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "368ae787d58dd146e04398b6713d0b45a740b70a1d0df25c1a0a203733b5abd1"
  end
  on_linux do
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.72/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0c2b08743eb35156bf26cc2a22241a0413e5eeb04c6edfb2cca3250ba6bd9f2"
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
