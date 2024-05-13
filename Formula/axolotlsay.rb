class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.133"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.133/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "7a8e4a4a4ff4367d3c78f85a2af3dbd792401da109c18c579c35829102fc213d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.133/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "8859e171116b3d7d30eac7d8641f5f4116f47377adaeff07b5598b0e4e695f46"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.133/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7452672e1b80952d4452d4264acd070e49e6ab1da0fe59ffff6268db6222e37f"
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
