class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.255"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_7OwoTzFGPSbmjY_wzTUsv/axolotlsay-aarch64-apple-darwin.tar.xz"
      sha256 "84f498dd984ebf31b45f7b2ad4cb34795c406dd2bdd6708a25cfe40dfc8e85b0"
    end
    if Hardware::CPU.intel?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_7OwoTzFGPSbmjY_wzTUsv/axolotlsay-x86_64-apple-darwin.tar.xz"
      sha256 "46c1283a16ae2802ce5f401b4700fcf59c5b78fcd90b44732009475e16c36c19"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_7OwoTzFGPSbmjY_wzTUsv/axolotlsay-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "151607e712e04810862ff187b30708bdd6bd2113961f833243e85db950a1f5e9"
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
