class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.35/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "e44ec362fe774f639a75cd22ae29edb0b293d9f9f817fc70dae195e0ba54c6c7"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.35/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "55e241aa34dc40c1e3f7936eabb9f081037fbabf51b34757b82cdf71596481b9"
  end
  version "0.1.35"
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
