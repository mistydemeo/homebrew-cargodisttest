class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.300"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.300/axolotlsay-aarch64-apple-darwin.tar.xz"
      sha256 "a6bdc81184661de13b3773b3915309a82632c88aec8b2961016f1dd979f9a89e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.300/axolotlsay-x86_64-apple-darwin.tar.xz"
      sha256 "9f33d079867c41e7400a8b4f071313a17d52291ebda273e6fc3fad26f41eb227"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.300/axolotlsay-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4b8eac2b29b7c0f089751318117a9a1927835b6af6e689f71101ca1f16ad4791"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.300/axolotlsay-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "55d773b99e4c1ecc61b9bf909a008545859c75465e9a987dba2bcca717431611"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-pc-windows-gnu":    {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
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
    bin.install "axolotlsay" if OS.linux? && Hardware::CPU.arm?
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
