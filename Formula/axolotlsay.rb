class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.62"
  on_macos do
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.62/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "95962e1e9089c7b3b1794fac294b19cbe3dea772f0d5beb5c546de3237a41583"
  end
  on_linux do
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.62/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ecec9ccb5ecb067413bda458ad9a5616d87513cd720e2c880245c5a5d5257bbf"
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
