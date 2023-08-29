class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.32/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "44c7d0361d942b91ba538bfc17c3aa14995484ae60d81a9f328d9fad3163f2e6"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.32/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "b708e65843f3865f1cef2a648593e5f06d5f7e9c9d42c6ac21625dda390bb7d2"
  end
  version "0.1.32"
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
