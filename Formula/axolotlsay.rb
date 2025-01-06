class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.323"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_EX0aF_zNC5yZrTxmo9Z5u/axolotlsay-aarch64-apple-darwin.tar.xz"
      sha256 "6c7a374e95379464ce2a7323fb723b8d77a51a0365f5324dc569d5aa8ee13627"
    end
    if Hardware::CPU.intel?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_EX0aF_zNC5yZrTxmo9Z5u/axolotlsay-x86_64-apple-darwin.tar.xz"
      sha256 "bea2570f0daecab69d9acfb3c9e9b40efcecf7b9f71c5c5898852a3657c8cda8"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_EX0aF_zNC5yZrTxmo9Z5u/axolotlsay-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "e04f16865d29b0e4c4543b38115d77d81049a2bdc94c68f519bc2b99fe6fc3b8"
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "aarch64-pc-windows-gnu":   {},
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
