class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.70"
  on_macos do
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.70/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "15c8cd384b3faf0eb0f839978ffdb2674eb53fbd0bcaaa379a7575bdff46833b"
  end
  on_linux do
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.70/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f7aa325c383dd0b7133bb5a68c77af8f12f3865ee582523805f83ab254b1bdf"
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
