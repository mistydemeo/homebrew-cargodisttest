class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.122"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.122/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "fc134e84fe5f4279470f53cde18064cbfe7da00b40e6aa9006e9513b2870bd13"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.122/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "62bb9ba2d9ed0793494efaf9432dacc3cdda9ce8a5afd08d74dc7ee01f5dc53e"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.122/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e4f8e34bcddcd2a36fb8d07a496d69ef3da7355c33af6eba52b4d76cee271ccd"
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
