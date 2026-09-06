class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.380"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.380/axolotlsay-aarch64-apple-darwin.tar.xz"
      sha256 "80d58899c8f13f87f97d33bcd60329ea94b3fc1bf9a3979c62212d97e571b8aa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.380/axolotlsay-x86_64-apple-darwin.tar.xz"
      sha256 "b78fc3a29faab2f7b9b16aaf4edf0592c23a6c1bee5c6edeb4a36d3c62cc0e1b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.380/axolotlsay-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "116ea6b0367e4ffe28d0da88310b9ba09cf338e2a75706d3fd7694d705e1c65a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.380/axolotlsay-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a7691b5d83dffeebc4d07677161ca8fced57d4c68a919343faf175ffb60de417"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":          {},
    "aarch64-pc-windows-gnu":        {},
    "aarch64-unknown-linux-gnu":     {},
    "arm-unknown-linux-gnueabihf":   {},
    "armv7-unknown-linux-gnueabi":   {},
    "armv7-unknown-linux-gnueabihf": {},
    "x86_64-apple-darwin":           {},
    "x86_64-pc-windows-gnu":         {},
    "x86_64-unknown-linux-gnu":      {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
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
    if OS.linux? && Hardware::CPU.arm?
      bin.install "axolotlsay"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "axolotlsay"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
