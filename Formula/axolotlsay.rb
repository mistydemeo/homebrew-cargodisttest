class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.78"
  on_macos do
    url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_Pl_bnBjm2XNQxGmZXpFxO/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "ce7167a08d12d65e960d0bb651ea5dd281e2f65727e688c784ed74552f44e651"
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_Pl_bnBjm2XNQxGmZXpFxO/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a16301e085eaa56bf4729f025da3dc705df0993182b117a6738179e082f2f74"
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
