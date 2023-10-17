class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.45/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "47baaba5eea2f6ca4f9ea2da872ac87fe8033e1dcda47d305aef5f1349f15eb7"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.45/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "0c1e9d9031216c199e5d28b1689f39a357acee3e7a6cd12d82462ba3669bf602"
  end
  version "0.2.45"
  license "MIT OR Apache-2.0"
  
  depends_on ""
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
