class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.105"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_PwyJAhPOWy63qifLJHeIN/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "70c408f0f599046114afbfa12cd5d5e87a42651dc6ba8054ebadb6251d3f534e"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_PwyJAhPOWy63qifLJHeIN/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "85018b2f1820dfa714521d5f3f8551c46c5a5feb374e452e9df1f2aa95918321"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_PwyJAhPOWy63qifLJHeIN/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "16a53162864900cd59b7339c8caf9ca2633e6645a3ef9fcc60b53b96f7d91c8f"
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
