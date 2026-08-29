class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.372"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.372/axolotlsay-aarch64-apple-darwin.tar.xz"
      sha256 "fda06cfd1abd390102771ac7d8f650dded26c2c78d260561de0ef8ae73d73fd3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.372/axolotlsay-x86_64-apple-darwin.tar.xz"
      sha256 "07cd9e3e51788cda213c57149f1b50ec5367d5c4d7a14cdeb5aedff74a3524c2"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.372/axolotlsay-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0b9ebfd9ea58012ff5e955a8f1deb292c07d23c6d203d19389e11cd89fc05d2c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.372/axolotlsay-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d8665abbd653ab27a95a91cf4236576379271ac07954235a92818d0cc030cafb"
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
