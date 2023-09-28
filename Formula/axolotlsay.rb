class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.91/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "54c143b6071c4312b669027ce4cb22a95812463c0ac288244bec7d97fdd6d4c7"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.91/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "7998f4d1c51e5ddf5f77c1647003a6fdc0dca7d455a5e921020643c2591b90c2"
  end
  version "0.1.91"
  license "MIT OR Apache-2.0"
  
  depends_on "libcue"

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
