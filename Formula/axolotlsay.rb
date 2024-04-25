class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.121"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.121/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "24ea016d782a3385ad96441f0cd6bacd14664c926f85232710447667e06d622b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.121/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "556b84cc285b364cd11ad05b37a8676035d7f2bb07123f5ed5caaa45ee2f19dc"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.121/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "67b29b57115fc97b6607947989b419ebe2a1a80ff52b28bf2d285cef6be83928"
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
