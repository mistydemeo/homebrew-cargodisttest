class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.94"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_gZtRdTfCCBGrjR7eXZiaN/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "5396235d2ea9f127373e1df16191c5f0356d48f5ab4e469fced0b14e0201dac1"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_gZtRdTfCCBGrjR7eXZiaN/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "c4d392094f8b0256717a0132202207b4f3da728a016fa63c2404c8b62147c7fe"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_gZtRdTfCCBGrjR7eXZiaN/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec9e3ff43973c36b1a529084b90805ac6a4fccce11f1c22112d1ad93e26f100c"
    end
  end
  license "MIT OR Apache-2.0"
  
  depends_on "libcue"
  depends_on "libcue"
  depends_on "libcue"
  depends_on "libcue"
  depends_on "libcue"

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
