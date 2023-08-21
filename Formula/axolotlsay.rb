class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.24/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "92d1e789705a0a21c3c31f47f3f973bc4c9dd0d6f9e873e6f5127b47a2d2d23a"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.24/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "34b4843130a7fede4ab07eab8427ec91794c2b28303ad7ef571046c2a13f1fa5"
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