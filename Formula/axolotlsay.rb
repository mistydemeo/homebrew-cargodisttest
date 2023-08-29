class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.33/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "c9c655cc7c7deb2b0d58eada9fcc194cf4dcf51927a77e29fda33ad89a0b8945"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.33/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "6bd51ce4d1e9cb90f22e889ea12033d9985e6750afe54ec3431bf709ff4b284a"
  end
  version "0.1.33"
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
