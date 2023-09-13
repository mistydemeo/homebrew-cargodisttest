class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.57/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "20adf48230ce3639277f59cdab248b94110d9a3440f5882baaafaab92a17ba5d"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.57/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "8b7667fe6b978726dcb393b98c306b0a0dfdbcd216e303b12b4abdf92ffc89eb"
  end
  version "0.1.57"
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
