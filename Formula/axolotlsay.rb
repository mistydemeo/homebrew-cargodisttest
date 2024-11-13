class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.269"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.269/axolotlsay-aarch64-apple-darwin.tar.xz"
      sha256 "3d3d51687727b281f24ab482bd66628336fd6f8c7104312ae26e4a1489b9873f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.269/axolotlsay-x86_64-apple-darwin.tar.xz"
      sha256 "058eba67a2d24c50e7d686e1b3a3746072a3b80958a6cd93665fa6ed818be215"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.269/axolotlsay-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "72e5024e7258ebc7439ea539f9309dc05064d07ffb222371bb7b7a9f198b208d"
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
