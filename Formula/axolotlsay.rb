class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.128"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.128/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "8929ad7e8bb314e9cf500692933bb5dbef6882ec3fabfba0c3121ea4a00c63d9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.128/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "b0bd48f021ee98a8a4164e27906a372f479a2d68233f307ea833d96d128ec9d7"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.128/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7545ad5a8a9abbb4aa61dd7c71e1079cf890b721e0493517110a05a135feaf95"
    end
  end
  license "MIT OR Apache-2.0"

  ALIASES = {"aarch64-apple-darwin": {"axolotlsay": ["cargodisttest"]}, "x86_64-apple-darwin": {"axolotlsay": ["cargodisttest"]}, "x86_64-unknown-linux-gnu": {"axolotlsay": ["cargodisttest"]}}

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_aliases!
    ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

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

    install_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
