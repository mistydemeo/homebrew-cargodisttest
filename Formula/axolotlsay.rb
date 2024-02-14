class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.102"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_rAAZFE_mdhT6jFXfaGO5j/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "278a4c34f4f2f501043844de9419ce772d2729d1af43ba60f544140b0f1e1640"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_rAAZFE_mdhT6jFXfaGO5j/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "bc11ae23c853bb39476c2e3c1204aea3a611049e3c91418ea8489d3cea4ac686"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_rAAZFE_mdhT6jFXfaGO5j/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9313054f7e139067f6b5b112a976c904015279906026aa0c15757706a49df4b"
    end
  end
  license "MIT OR Apache-2.0"

  def install
    on_macos do
      on_arm do
        bin.install "axolotlsay"
      end
    end
    on_macos do
      on_intel do
        bin.install "axolotlsay"
      end
    end
    on_linux do
      on_intel do
        bin.install "axolotlsay"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
