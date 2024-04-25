class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.120"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.120/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "581852592ac9c9a2514ffa5aa91fbb3006a723ad49d639b1405071e9c8d1e4d0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.120/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "2b23004d9e86924fb405c03d3ed7efd1f9f7569049eb67bbce832a9c1b607e9b"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.120/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "909540c6209d7737169c686fbf5c9241959bbeccbcba6ec19dd2e883e5acc1e3"
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
