class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.63"
  on_macos do
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.63/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "9beed117d8e784ca239898ba978ff94400a9e34c770f310b4187a7677e5bc1f8"
  end
  on_linux do
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.63/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e69aa6d5a5d50e0cd0213026fabaef952e9cf2837a18dac6615b16fff05020a8"
    end
  end
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
