class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.239"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_xHXUHkjFwBjgRk9J32QVN/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "18e52487cec0c61464009a89c9b7593440d5f53c77697e57e01d62b5f89e5d08"
    end
    if Hardware::CPU.intel?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_xHXUHkjFwBjgRk9J32QVN/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "88418a864030a9deaa7bffb05fffb2fa39283a4f3a074e88567cd77c55de2cf3"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_xHXUHkjFwBjgRk9J32QVN/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2a6e9f78da1327d487a582e72968c2883d3bcf18fc4f446024f36d6f5d857951"
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-pc-windows-gnu":    {},
    "x86_64-unknown-linux-gnu": {},
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
    bin.install "axolotlsay" if OS.mac? && Hardware::CPU.arm?
    bin.install "axolotlsay" if OS.mac? && Hardware::CPU.intel?
    bin.install "axolotlsay" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
