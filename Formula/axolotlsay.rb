class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.44/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "8100d311b62a97e156ddbe30101466a5c871c9c2f60ba9d2944481e314ee149d"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.44/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "22596bbed7789001a98484aff66b1785afa629b11fab42e688028ae3ea94cf6e"
  end
  version "0.2.44"
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
