class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.373"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.373/axolotlsay-aarch64-apple-darwin.tar.xz"
      sha256 "bce26f04aad774efb7a84b8e6d07839834eac305ec67877f0f5bdbcceb5d51bf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.373/axolotlsay-x86_64-apple-darwin.tar.xz"
      sha256 "d011dd36bcdbea1546fe0e0ea8745037c83566f083a0178e798f9497ac67dd91"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.373/axolotlsay-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "52f489cba9e2fe92d573e011a4016b6531e20a17db8f739c55fde85b3988010f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.373/axolotlsay-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a01528b14b988292ba451b26fbcf45ef3fd0a3bcb02175763c3bd58f0fc9738e"
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
