class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.60/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "7de68fbf624f7c342e896314efb7f05e3f86344739aa9a9b7e913c4bb1c0730e"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.60/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "978f4f26fcfb4937b4c5f16dc57da471bfde71615c029a531dbefb6ad8a10dbe"
  end
  version "0.1.60"
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
