class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.99/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "3b438a2191b04541d5522a511b8609da4f7181e795ddc18e2069e2089702043f"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.99/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "0e8c158ced51d9e6e87ab0bf61b4b93453dbb09c808c096fc20441316f1d3273"
  end
  version "0.1.99"
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
