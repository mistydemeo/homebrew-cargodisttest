class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.2/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "df93b9e045c88f0748a7ac0a95903c2f286b1e0bc863a25ed912b807268baf40"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.2/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "57f910e69dfbf1039e64f6cae72319fe32890fc71107b34c76d0256ef216c605"
  end
  version "0.2.2"
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
