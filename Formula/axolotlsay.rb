class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.43/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "f19dee9b50ccaf2ab0b14ec058c7090fecb426c66681119b8954c14f05ace4f6"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.43/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "a7924b54dec71aeee3a85de2603cbd9668627bf2c4f01b492bb64bc7ad015ec3"
  end
  version "0.1.43"
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
