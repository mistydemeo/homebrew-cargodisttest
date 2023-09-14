class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.68/axolotlsay-x86_64-apple-darwin.tar.gz"
  sha256 "32963c882fe3aeb8b24c293384bb236c25f437baa37b163a5ba947b3000ca7ab"
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
