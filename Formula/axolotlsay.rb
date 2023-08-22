class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.25/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "b4ef1d2aa0c55db88702d41072b7e7b248de77cb149e3f5c0d54262567e6ef52"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.25/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "4ee936feed86a3a8924bdca08073302f62d4552ec76a82e78ce94d90a87fd3b4"
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