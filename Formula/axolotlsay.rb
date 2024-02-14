class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.100"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_lULBVZcPNMWNoIeaiTao1/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "230db689b9bed48421b4b17a1733ad4caa69151898b2fe3d4ab0140edb82d82c"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_lULBVZcPNMWNoIeaiTao1/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "b99c55eb1903a4be6b02d1dad1bc9414f18ce83548a7af95742d1d3746dc738d"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_lULBVZcPNMWNoIeaiTao1/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "00cca9e808045828e2516ff703eab1a776e0688ec9a065725436a47faaae539a"
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
