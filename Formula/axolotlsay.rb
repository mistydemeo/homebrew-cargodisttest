class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.126"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.126/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "cec0d7f34261f81cb4d6025522cb48def37aee90a2dbe4fc2d7a17148e4d9210"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.126/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "5d074f06b9ac983f4ceb0a80c054e51c5c3fb305284bc086f7f803096778a298"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.126/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62f07dc38bbe86657f83615faae3c7cef3222603b1f4eed9644d94716363b675"
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
