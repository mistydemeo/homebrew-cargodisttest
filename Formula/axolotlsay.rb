class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.93"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_giorMQVXuOUQaH-HpDHCt/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "dad1a74daae449e81be6d58f23dca5b5be03786bf3c0e1bcafd1ad745bbe3698"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_giorMQVXuOUQaH-HpDHCt/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "095786607e1227a737881aa2c75ea3fc667011e933a882312e684c68f0291b8b"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_giorMQVXuOUQaH-HpDHCt/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "309e0da9f0622329cf368930de4fea649d1724cf79ce77fe25a75d4731237888"
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
