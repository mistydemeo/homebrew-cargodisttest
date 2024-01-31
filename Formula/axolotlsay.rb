class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.92"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_AT70enp8mLjoqRaJiWgTz/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "93d36e479a6924254b36b1b9ee546c2e994c642a9cd112ba45e5ceebcdf9f4d3"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_AT70enp8mLjoqRaJiWgTz/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "6f147f65034d5796c8f6f9f0ced7bc46f4e8b1481b8d61c6e7653ab788e428df"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_AT70enp8mLjoqRaJiWgTz/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "67f281a08f9f05588576265f929567b79dae165044c682d8699ab8fd73e0342d"
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
