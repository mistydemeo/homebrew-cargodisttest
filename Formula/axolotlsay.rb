class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.61/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "4c41e3744406a9db3746ded2940ff1fdf875635718067eae7b5cc8d6b34cb8fa"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.61/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "3dc9662fda2f67851e4b5a742733a3b83025ea1b9754bb3b4e193f100108cd8d"
  end
  version "0.1.61"
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
