class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.87"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_egwBHFFfKNSeAi_1mYHbS/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "dbee4880413561028c7bc2607911e6fe477656ed1aeba89beb601cf9d866c601"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_egwBHFFfKNSeAi_1mYHbS/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "cc2f7b1611e9c4d09d657906e269c2171b0670ca38e2404eeab0013d407e32fa"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_egwBHFFfKNSeAi_1mYHbS/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b05db598eda46f166e354749ff383dfdb31b87594daa9973fc4f6f777ebc65aa"
    end
  end
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
