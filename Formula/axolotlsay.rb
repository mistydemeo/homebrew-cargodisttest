class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.290"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.290/axolotlsay-aarch64-apple-darwin.tar.xz"
      sha256 "54b9ebc7da6a08739d84532f1616608746ad33fb4b2b818edde69cf30465983a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.290/axolotlsay-x86_64-apple-darwin.tar.xz"
      sha256 "d30e062488d9a4134851805b69233f0760603f0c43738853801a5902e0049d32"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.290/axolotlsay-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9319bf0904a9f0043c60741b6e543e6aed65bab525dae628d49dcc3c7b66372d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.290/axolotlsay-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "90300d2998a524bd079a17b7ff66b676db1c58db2abd6c6033ffa1601e9b4fcb"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
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
    bin.install "axolotlsay" if OS.linux? && Hardware::CPU.arm?
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
