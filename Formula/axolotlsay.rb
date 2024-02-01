class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.96"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_Eb0w4qlF2-cvatVKYKqe8/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "a8ba2279e4f615419211dd3876d06f1554f05fdf94d297091aa31e2ed0b3f168"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_Eb0w4qlF2-cvatVKYKqe8/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "25513424f2d0f7fcd2d7a24ffdae5a17facf22a5e287b9cd9c0fa6e8c1ab0831"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_Eb0w4qlF2-cvatVKYKqe8/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f4802069397bec94592bda04b12e0dcda409b718a2b77b202d830c47bcb1fe4"
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
