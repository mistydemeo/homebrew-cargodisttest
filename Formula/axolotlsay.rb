class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.97"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_KQ4Rbbz49dP-qu30zodND/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "394c6956abd00e25714a49dcece6525b92e5aa103e8dab23dd81e169dd88c507"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_KQ4Rbbz49dP-qu30zodND/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "48d8d248873607c770898a857e07062e6998097e48079971538dd2ed0cf589a7"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_KQ4Rbbz49dP-qu30zodND/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9895dfab429ebe2bc809cf59ffd36cc5140ab5953e627bd6096dbcadc44ef2df"
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
