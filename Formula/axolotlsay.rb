class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.123"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.123/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "030559650098760d52e31b5e6b56c78b57e6bd82fadb9233c0046532bde3a5fe"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.123/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "6609d6fb308c657f9b71ae9f8722a33a641486d24b419d9dbb6d0b7dbca326e7"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.123/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1746e46c90db8642a34d33b4c0aa92a25ba78409d8815483f543dec52c913a66"
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

    bin.install_symlink bin/"axolotlsay" => "cargodisttest" if (bin/"axolotlsay").exist?
    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
