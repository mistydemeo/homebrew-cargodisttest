class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.60"
  on_macos do
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.60/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "dff394fe1cd1acf9009370cf3efe72f89eb61289b504af29b96a639f84ad215a"
  end
  on_linux do
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.60/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "587bd4a5634452a4dacb4cd6a2a3e7eeff1e8a078a753ab5e3fbb40a0a18a0f4"
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
