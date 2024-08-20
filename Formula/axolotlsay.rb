class Axolotlsay < Formula
  desc "CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.224"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_nYq-r0a4o9nBzKU0joeUf/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "c637288ebd23ad74ea50c7e33efd11bff2211f1a66860fcae900c81e52888033"
    end
    if Hardware::CPU.intel?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_nYq-r0a4o9nBzKU0joeUf/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "4c52304e11e7e18f04313f5b5e55946158385d1a48c1c7e2d6874b922a537509"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_nYq-r0a4o9nBzKU0joeUf/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3fac7a1ca614d76ced800ba6ca9ec69b98dc2135ea2bf8d74059267de772276d"
  end
  license "MIT OR Apache-2.0"

  BINARY_ALIASES = { "aarch64-apple-darwin": {}, "x86_64-apple-darwin": {}, "x86_64-pc-windows-gnu": {},
"x86_64-unknown-linux-gnu": {} }.freeze

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
