class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.110"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_pCKQZq07yQgxcmRRY8lV1/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "419d9ffb8887e779f5df20a5f4ac1f5ed50ddccfe088eaeec1b27221e97a043c"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_pCKQZq07yQgxcmRRY8lV1/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "e9765bf0cd82ceef830112f85e27dce9da1bb33f49d261d27d5771fa66df8a55"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_pCKQZq07yQgxcmRRY8lV1/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03850966765ee741751e5b5d9efc5861e8f65a46dc4ff07c2e04d09c870a8c21"
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
