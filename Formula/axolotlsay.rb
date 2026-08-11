class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.370"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.370/axolotlsay-aarch64-apple-darwin.tar.xz"
      sha256 "ae74ea55d5ad69d8bd823191717793b4e73d0f9f6586ba2dc5876d086140114c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.370/axolotlsay-x86_64-apple-darwin.tar.xz"
      sha256 "7aa0a43ed9fe12d84f53cbcbe3d6805a2d64f0de16f61252275f450f3b5b7895"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.370/axolotlsay-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "eba4e03574812a577d68f6c861174fe795174fde082941524006137673eb0e48"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.370/axolotlsay-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0eb31db8fc400d82732c692a1a55364c8e9fa3d591899e34e580b136fe721d08"
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
