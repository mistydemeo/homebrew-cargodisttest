class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.106"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_Jx23UzjX2YHWuBDPT-n3f/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "78fe8cc5105687f94a543319a126a65c300e12ac144448f6636e2250f1e4cf3c"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_Jx23UzjX2YHWuBDPT-n3f/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "9b8940d35d60301d8c1ff3b3034725c32a322460de99932331dc15dd96fdaaf4"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_Jx23UzjX2YHWuBDPT-n3f/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54db7a070375904e4614b1a2b549ac5bebf225e4c82af2cdf93f2bdcfaaef6bf"
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
