class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.101"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_JXoCsZnTEYhU9707lsPCZ/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "911787f58f4b4a3b049b29b93be202b0f31fbb00525ba1cfc9cf4cdc62cadc7f"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_JXoCsZnTEYhU9707lsPCZ/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "c26e92cf2aa6cd9c91b763efb66579887d9240b96fdd465e1e4bb8c62fa88004"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_JXoCsZnTEYhU9707lsPCZ/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ae116f0e532d40e82f03217dd9c87596028b01ce4f62b09009697a9b9dfe8ed1"
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
