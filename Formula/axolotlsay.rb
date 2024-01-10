class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.86"
  on_macos do
    url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_mc2qPpoABXbq-OwEK0I9V/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "4760bfae958390c0d42a9603291875ffaf1832c27a4171d6e6360267b8972e75"
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_mc2qPpoABXbq-OwEK0I9V/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "172c5d010a6e11d2390c5893f975169fc22126cd006c8c9935cd8c10594291b5"
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
