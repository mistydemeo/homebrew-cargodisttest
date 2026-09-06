class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.379"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.379/axolotlsay-aarch64-apple-darwin.tar.xz"
      sha256 "124b783bf8022d5915e8e55fd8c01928ecdcfc7db09d27d24f335b1d25d02110"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.379/axolotlsay-x86_64-apple-darwin.tar.xz"
      sha256 "fdcd882881cec07797f9f5af35e7614a72bbebc29302e7f18d6023eb3c27d620"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.379/axolotlsay-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "76c9dae51a26b6fbd97c7be51e352b19d42677c89328ce7f755f92aa2f8ea0a2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.379/axolotlsay-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "fdd5e3ee06f31b0a363ee5aedb84be29640b26a7ef69b9a97dcf0632ff4f051b"
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
