class Dist < Formula
  desc "Shippable application packaging for Rust"
  homepage "https://github.com/mistydemeo/cargo-dist"
  version "0.101.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.101.0/dist-aarch64-apple-darwin.tar.xz"
      sha256 "1b4be58c05548d1b5f2e632138022b588279debeec228dd8ed975c1d10932847"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.101.0/dist-x86_64-apple-darwin.tar.xz"
      sha256 "bf4fa3f8a22cfac4491e59725c0080ed0117b5af7ef848ab32bbc14e194f0a3d"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.101.0/dist-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "5a2c48ebc783aee7cd0aa74b4070af0bd76a14efdf1ece4faa014d986ac93369"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.101.0/dist-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7b9a56a6dee7acfa74673d875074f446ef7a10acd32b282c791782295bff75f6"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":               {
      dist: [
        "cargo-dist",
      ],
    },
    "aarch64-unknown-linux-gnu":          {
      dist: [
        "cargo-dist",
      ],
    },
    "aarch64-unknown-linux-musl-dynamic": {
      dist: [
        "cargo-dist",
      ],
    },
    "aarch64-unknown-linux-musl-static":  {
      dist: [
        "cargo-dist",
      ],
    },
    "x86_64-apple-darwin":                {
      dist: [
        "cargo-dist",
      ],
    },
    "x86_64-pc-windows-gnu":              {
      "dist.exe": [
        "cargo-dist.exe",
      ],
    },
    "x86_64-unknown-linux-gnu":           {
      dist: [
        "cargo-dist",
      ],
    },
    "x86_64-unknown-linux-musl-dynamic":  {
      dist: [
        "cargo-dist",
      ],
    },
    "x86_64-unknown-linux-musl-static":   {
      dist: [
        "cargo-dist",
      ],
    },
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
    bin.install "dist" if OS.mac? && Hardware::CPU.arm?
    bin.install "dist" if OS.mac? && Hardware::CPU.intel?
    bin.install "dist" if OS.linux? && Hardware::CPU.arm?
    bin.install "dist" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
