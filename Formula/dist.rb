class Dist < Formula
  desc "Shippable application packaging for Rust"
  homepage "https://github.com/mistydemeo/cargo-dist"
  version "0.100.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.100.0/dist-aarch64-apple-darwin.tar.xz"
      sha256 "e1e5fbba8c70a4ab171ce8a6c8cc3c2daa0f0230e92e4f128b3eed30e90788f1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.100.0/dist-x86_64-apple-darwin.tar.xz"
      sha256 "9b2b6defddb762db4c98548e9b739217ecebbe361174a2d58c7a107720c5d41f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.100.0/dist-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "598120bc9d9d93db388569232bd296a527ef69bbc49ce94965ea425566dbae67"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.100.0/dist-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8bfa6702c47090e6b467992efcc611cfea31e9490e6dd8880711bc2a08950e05"
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
