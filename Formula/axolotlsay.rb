class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.88"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_iRj7heGg4wApmFT5zbJ1C/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "18b9ecdcae164191a7b80238927ed6c37e8b3f4fe4cd311016ce4b60593e1c2c"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_iRj7heGg4wApmFT5zbJ1C/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "f977c68def2c0b8be98db9c3b76e80c53d83a1956afbcefb51ed9f1db210b699"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_iRj7heGg4wApmFT5zbJ1C/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fca81385a3a47f2dc62be6afdc0221319ce093c12f9cb0b72698fa76b68bb907"
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
