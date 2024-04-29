class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.125"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.125/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "c7e1e65b95ee1dfda12c3bd21b87283e145ea2eaa886b068d7705cef7a40aec1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.125/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "38ac041953088651995b8899e57fffbe79ae0c45d8992d7ec14213935257cabf"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.125/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c444fb54d4628e92dcaee512246c73e590008f107f0ca2e342735d58c2d0b901"
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
