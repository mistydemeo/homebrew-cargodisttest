class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.31/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "26bf0eac679661a7d103f01d98a599a482cb44729f7f1dd3d26bbb82a7b7c31f"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.31/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "0438b5eae9187c604ae7601c5cb7ede0b3e41998ef1db51a343dd4c13c8f02eb"
  end
  version "0.1.31"
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
