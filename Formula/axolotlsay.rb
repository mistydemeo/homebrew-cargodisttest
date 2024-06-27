class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.198"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_V6429VUnGX6S_j1mX8KkX/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "3173d82a57a8573fec7db44457ca2efdb0bb00d6011f4e9848692703ceaeb9de"
    end
    if Hardware::CPU.intel?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_V6429VUnGX6S_j1mX8KkX/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "53902fbfd7d2daf558148b13cc3127c695265597a53ccbd5c6d9ee415399ac30"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_V6429VUnGX6S_j1mX8KkX/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8320b541d34cb25c4d766c8214af2e16a421278534349d717a81cd3440f30840"
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
