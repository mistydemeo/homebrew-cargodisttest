class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.33/axolotlsay-x86_64-apple-darwin.tar.gz"
  sha256 "c7be25dfcb7ad000e078c89e908ac2ae417c4b4ec6bc6b57fc56af946370c8db"
  license "MIT OR Apache-2.0"
  
  depends_on ""

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
