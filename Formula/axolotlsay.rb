class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.79"
  on_macos do
    url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_Nur0CUSf1d0oIJC_8wu-O/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "5c1a5a347e38d92cf5752cb7a91c5d5f4c75ce309318d63f599fcf2def681039"
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_Nur0CUSf1d0oIJC_8wu-O/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fba4bab0f2542e43bb7d481838e169d0412c8cfe2827529cdc3af80ddf8ae7ef"
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
