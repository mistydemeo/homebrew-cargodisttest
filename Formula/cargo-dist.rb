class CargoDist < Formula
  desc "Shippable application packaging for Rust"
  homepage "https://github.com/mistydemeo/cargo-dist"
  version "0.90.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.90.0/cargo-dist-aarch64-apple-darwin.tar.xz"
      sha256 "0e6a499b1e885d65d593362b360bff3d4f631d21a3eb3139620ca55d43ad6d8f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.90.0/cargo-dist-x86_64-apple-darwin.tar.xz"
      sha256 "93097c781f702e0e346d72d2e32304eb5263d82a38ff4c5a86ce1cd028cd2997"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.90.0/cargo-dist-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "57464a95c4016fc47de0302e0a4843b680d379f9fcbf58d074d18d39e2bdce9d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.90.0/cargo-dist-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a9a42361530c749d8ee97525c463be0caa5c08271feaed3a31539663dcb993eb"
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
