class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.206"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_NNXD2mmdY34mLO6Q0BaEQ/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "4ad7d4bf3a1702024f088f47f7b4bb383fd27c8ed33b4f4a198e4f18d0997eda"
    end
    if Hardware::CPU.intel?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_NNXD2mmdY34mLO6Q0BaEQ/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "1fea31e4fac7bc70814021b4a7ea79d6f0d0cce6e459f1469b8dcd4889eaa5b4"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_NNXD2mmdY34mLO6Q0BaEQ/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9f57471f8d3ff479eb6e4fd316df6271d3f6ba4116d94a04313b3371c900a2e7"
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
