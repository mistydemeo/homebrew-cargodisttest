class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.59/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "ac044964d7628a2bf08a8221ce8e219e88ce51ca540113dabdfd5daaa09c7b7b"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.59/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "47400f3a9d90d0fe9feb68ff51d3b62a1376d5f78f427a5e72af0c038d6c24d6"
  end
  version "0.1.59"
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
