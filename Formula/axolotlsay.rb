class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.38/axolotlsay-x86_64-apple-darwin.tar.gz"
  sha256 "c4875d960c9f6d8bab673b774165dbec2cbc9462ce2a950aecaf2267a39e4cd9"
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
