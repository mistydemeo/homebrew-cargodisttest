class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.36-prerelease.5/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "9ae110505222fc94be63c2683a1619aef96142aeabcdffa88fb3a6928a202af1"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.36-prerelease.5/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "34e982ab863fffd54b82b1ab49acd130d73349be5d28dcfb0bde6c61afdf666f"
  end
  version "0.1.36-prerelease.5"
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
