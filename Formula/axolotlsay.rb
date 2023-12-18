class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.77"
  on_macos do
    url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_DrnjSE79lPLJbuyQFUceg/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "429cc99e3ce0fc51dd3fce76d80735fa5d846e9d594465c7fa1203568f2aab21"
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_DrnjSE79lPLJbuyQFUceg/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f5f3a96b9d63abb5de47e0bb322297024b68d43e1e60a3cc0800a67723123b48"
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
