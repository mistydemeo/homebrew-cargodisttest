class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.99"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_yvVRzzbwLNqzr6l1CPEsh/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "71b58a030b5f8d3e09d5a27eedbc7b595eb5c72ed6f5c939a92d04027410af64"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_yvVRzzbwLNqzr6l1CPEsh/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "2ff13ce7585eb016ade76827b50f2047ee48c09e2e300bf4bc0820a38421fbd1"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_yvVRzzbwLNqzr6l1CPEsh/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "397779ac84a34633d39ea9e6e49e1e6e07a46e8d7e20ac6a8a18a2199c48c001"
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
