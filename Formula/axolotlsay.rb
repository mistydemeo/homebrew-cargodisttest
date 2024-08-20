class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.220"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_iZEm_ohykckCIbz4dakJq/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "2fa61e79b806bff1dc7e708bc640a375fa17ac23a0e3208312e5a966ebe0b8f9"
    end
    if Hardware::CPU.intel?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_iZEm_ohykckCIbz4dakJq/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "366b040aa59d7ad29d1c3ccc35c78d90395c463560f8b70f54ff126fe2eda34b"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_iZEm_ohykckCIbz4dakJq/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87b4b40e301cad3fc5dd020fe6a88dc79c0a79cf8e8f34eab6f4f6418b54f7e0"
    end
  end
  license "MIT OR Apache-2.0"

  BINARY_ALIASES = {"aarch64-apple-darwin": {}, "x86_64-apple-darwin": {}, "x86_64-pc-windows-gnu": {}, "x86_64-unknown-linux-gnu": {}}

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
