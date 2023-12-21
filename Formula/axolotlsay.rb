class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.80"
  on_macos do
    url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_Xi23ENMgEfsOn6SV62p-P/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "5939220b185ce03c76f477fa97607617771259bdb7c6aaa0ffb00a59bef1f296"
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_Xi23ENMgEfsOn6SV62p-P/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6e0ada208727c3f6572751c9b455624ad7d7b77fa23108066987eafd95b47e8"
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
