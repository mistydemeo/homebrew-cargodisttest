class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.73"
  on_macos do
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.73/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "748b65324e1ced3362e7f937556cc70c7fd807879f782fc076acae450f19addc"
  end
  on_linux do
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.73/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcca3a9c4eab3ee3976dc548c34c27f296748a101b139f63d017a62de74b0f9d"
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
