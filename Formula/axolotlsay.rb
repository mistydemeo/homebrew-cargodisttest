class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.58/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "120ef9ed79b85a8dff4eb555366e1347f01e8a2b6d4dd5722ace06f7b6e1f3c6"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.58/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "58284a2833d476e3619c1760c54e96eba474e5db0340662d28d5683f2f05fb18"
  end
  version "0.1.58"
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
