class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.66"
  on_macos do
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.66/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "8599fbeac6eca7d1389df1bce18d32d6929ebbe65e46d1e94148183b56d7bf67"
  end
  on_linux do
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.66/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ea3f287e6fa1102f3bf821e03bfaf31d18ea27d0cae1d967654e45a0d93f73e"
    end
  end
  license "MIT OR Apache-2.0"
  
  depends_on "libcue"

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
