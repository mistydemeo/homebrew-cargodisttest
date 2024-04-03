class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.115"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.115/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "c2a562955627bf66eb95cc69bc66dd5d2344b4f671d248a494f3c8d69dde9aba"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.115/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "724406610f5f79bc8cb4d2b61fe5df4c2ebef2d993b9d34dbf23970a2d833910"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.115/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5296ed72ea2dfb40a3c6cc143e3a03ab5b045a20bbee76d4cce749b47a720450"
    end
  end
  license "MIT OR Apache-2.0"

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "axolotlsay"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "axolotlsay"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "axolotlsay"
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
