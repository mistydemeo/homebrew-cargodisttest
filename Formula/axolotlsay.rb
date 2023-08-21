class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/axodotdev/axolotlsay/releases/download/v0.1.20/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "8d4760fc1dfc0f4c3900044267276dc36e86d9668c2953d288d8453a6eed6fa1"
  else
    url "https://github.com/axodotdev/axolotlsay/releases/download/v0.1.20/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "cfa92300899c6ebf03934b07e6decfdbc9b548ca1a2e58149460ea8c47363fb5"
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