class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.257"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_gvQsz86WcVyM1DpUVmfRY/axolotlsay-aarch64-apple-darwin.tar.xz"
      sha256 "408c3bee3443f86e9840e4add333e1526130ab535ed290deb943978bcd22dd35"
    end
    if Hardware::CPU.intel?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_gvQsz86WcVyM1DpUVmfRY/axolotlsay-x86_64-apple-darwin.tar.xz"
      sha256 "85ae274d597673ffacc1c671c32b294b8cffe3d8f7c378862449c4c5160b8bcd"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_gvQsz86WcVyM1DpUVmfRY/axolotlsay-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "2692f77b4e2e48622b1e7653e00bc692ed01a1e038df82d02ce6c88de40b3404"
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
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
