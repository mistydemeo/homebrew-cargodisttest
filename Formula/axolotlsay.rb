class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.67"
  on_macos do
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.67/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "ed2488b2c637c614e151c9059f5f4b65374602f2509802b3477fe6c30fa29e1d"
  end
  on_linux do
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.67/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "33bc40f099d77159123a812155051bb8ccb73ba107a346866f82d76b80a25082"
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
