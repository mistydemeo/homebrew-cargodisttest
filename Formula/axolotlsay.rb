class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.52/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "435ada6dc610d2822b18680920818a87df5c86b93c9565b5a6d0a67c923bde8b"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.52/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "05425bc35c0b78502341a76daf46836c780e244d6b4c92cc3717539a4df2b44d"
  end
  version "0.1.52"
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
