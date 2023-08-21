class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/axodotdev/axolotlsay/releases/download/v0.1.23/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "0ee394e86db2bd2c6bb3eda418c2da03d1eac5ea700fa9abadbedec786778dd5"
  else
    url "https://github.com/axodotdev/axolotlsay/releases/download/v0.1.23/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "44d4344e823d6bdbff6b0d7da2b37a7c30048bc78818bfb6434d5c668b56bc98"
  end
  license "MIT OR Apache-2.0"

  def install
    bin.install "axolotlsay"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end