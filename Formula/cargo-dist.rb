class CargoDist < Formula
  desc "Shippable application packaging for Rust"
  homepage "https://github.com/mistydemeo/cargo-dist"
  version "0.90.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.90.0/cargo-dist-aarch64-apple-darwin.tar.xz"
      sha256 "5b61f91eb2204d0d01dd335ccc10b9248af65b7512e50c68a25e6bef47ee382f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.90.0/cargo-dist-x86_64-apple-darwin.tar.xz"
      sha256 "741a12d7674b35821734aa741fbba8242c252b89f48b415ca5021a840744b613"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.90.0/cargo-dist-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d0bb3bc81c2832f9f8a28f34a87c47c6dadb6b9697d9d4f06f588378cc7016a5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargo-dist/releases/download/v0.90.0/cargo-dist-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "51c40d49f1c104aaf04081d9425ea2212d59492fe92a0b8b65a5a576332465f1"
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
