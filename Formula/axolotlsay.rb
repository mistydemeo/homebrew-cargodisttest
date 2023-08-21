class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/axodotdev/axolotlsay/releases/download/v0.1.22/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "fcdcac5e02232042f5b4631484e11e8e9fe75f5ea8d5e03619ac49607a9e5c57"
  else
    url "https://github.com/axodotdev/axolotlsay/releases/download/v0.1.22/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "9c0a30e9dd36c59d342c08735fc7813842ce4ea7522edd512d0e4b87f8ca4b27"
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