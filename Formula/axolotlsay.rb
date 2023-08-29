class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.34/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "ce885d13cbf7ddb2fef025e0581567d5fc9b81c599d527b60b69e647c39ff6b1"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.34/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "a0545072ce21467ec3b79ecfd2d45ca6bb7156f8c80f6a2a6ffaed28a4c09d99"
  end
  version "0.1.34"
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
