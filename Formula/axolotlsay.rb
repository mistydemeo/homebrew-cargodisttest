class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.247"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_5EQibBbJNVN43kqNRrSdJ/axolotlsay-aarch64-apple-darwin.tar.xz"
      sha256 "a718a6ed19ae310bf7fcdd7301b99f6976b430bec3fde75d2eec0545af7b73ec"
    end
    if Hardware::CPU.intel?
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_5EQibBbJNVN43kqNRrSdJ/axolotlsay-x86_64-apple-darwin.tar.xz"
      sha256 "0a679256eb90107ab9a5463528f9210ab327ae703c1c6dba3348f1653c4ca186"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_5EQibBbJNVN43kqNRrSdJ/axolotlsay-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "44a40dc457f612a5865cda85867aff79f11373236abe765cf360254fdc349d02"
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
