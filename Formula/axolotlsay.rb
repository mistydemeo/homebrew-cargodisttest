class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.54/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "a79c9eb64264bf6921aabda457a697411e50abe9655a1dc3319a96eed6bce359"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.54/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "88018728d47ac13d9729deb80469a9c24318e2bd38cb880aa836b53f0cf9c551"
  end
  version "0.1.54"
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
