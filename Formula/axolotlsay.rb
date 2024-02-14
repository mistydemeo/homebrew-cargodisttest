class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.103"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_C2-b7U2YErM8IQ9gwOHcQ/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "edc1451c6a1218614addfc6f68d36917a58b59dc18c923584489ad9b8f1890a4"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_C2-b7U2YErM8IQ9gwOHcQ/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "b8c8190aa150f2e8e7f83fe2d84135f0747dd68b282cb52d7370f151f5925405"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_C2-b7U2YErM8IQ9gwOHcQ/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a92c654bfd51af0e2c889cd6aa3892fa62bd5de217258670026f47def7cb3344"
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
