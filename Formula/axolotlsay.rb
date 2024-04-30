class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.127"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.127/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "26f5ce2283a0c4ed0310a32390039a2b6c1e257c2a8f945811f45ac8340629ca"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.127/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "75238b4beb33766c133828e8250c03ac464e519d017a85ee8e3baa0b5800fb22"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.127/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d1019a309c29feb4593b47746aec446604c39d640106bd6d0ac1d6333e3eb74"
    end
  end
  license "MIT OR Apache-2.0"

  ALIASES = {"aarch64-apple-darwin": {"axolotlsay": ["cargodisttest"]}, "x86_64-apple-darwin": {"axolotlsay": ["cargodisttest"]}, "x86_64-unknown-linux-gnu": {"axolotlsay": ["cargodisttest"]}}

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_aliases!
    ALIASES[target_triple.to_sym].each do |source, dests|
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

    install_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
