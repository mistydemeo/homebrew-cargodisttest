class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.84"
  on_macos do
    url "https://staging--mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_ELSajI2-1Oweh6vIjtMcw/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "9b9f5a61a5d3827fa31bc0eefc29d20b2e43c23e78af8b403237e0c86785c0a2"
  end
  on_linux do
    on_intel do
      url "https://staging--mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_ELSajI2-1Oweh6vIjtMcw/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "870c39db220ae6725a34f37ef9a881997080a883b9fc39e394e19142882029b2"
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
