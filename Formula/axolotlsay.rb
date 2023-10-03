class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.97/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "93074cdeb7e2ca870911ef8fd3a4f2ea369c5249615874b2060d4c72cf40b945"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.97/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "692babddf3314fcb73d53c8c69a0d89fc71f98c7082173a313a18199468f764e"
  end
  version "0.1.97"
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
