class CargoDist < Formula
  desc "Shippable application packaging for Rust"
  homepage "https://github.com/mistydemeo/cargo-dist"
  version "0.90.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.90.0/cargo-dist-aarch64-apple-darwin.tar.xz"
      sha256 "90c8ba19f9ae00b614e53328482c2246858c4acf21a6cbd0027ce44013ecb7d7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.90.0/cargo-dist-x86_64-apple-darwin.tar.xz"
      sha256 "f4924fce3dde5c4683aba83f873d1cbc2cf1b015fff05300b4fc5fd1def20423"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.90.0/cargo-dist-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "87ac9516b3063800989a0e2eb4b55cc81bd2c81f23d66d475b673b34a0da08f9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.90.0/cargo-dist-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "dfd85f5382f703ca04dc115aabf3e5408985f2dc65fef4e37db2d1e3e10ff3aa"
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
