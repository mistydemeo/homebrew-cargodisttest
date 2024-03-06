class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.112"
  on_macos do
    on_arm do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.112/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "7b24c5f9c9410561c0c566b9c1439fd0bd08f0160bb0bfe4f47f2c91181c9490"
    end
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.112/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "c714d86485428bd6f2053558a19b707b4fbfdcdc46074a5af6c681ee43a49e26"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.112/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8625d22b657b92b3dfdb6fcdfea06cd9ddec777e19d9f6f7a10e2e3d4ce957d8"
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
