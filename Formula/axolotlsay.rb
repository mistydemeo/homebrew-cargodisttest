class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.108"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_5Pn9UFsVwJoAkYd4DdMs_/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "241be636df812f6e8abdbcb7f7618b132e1212b51fb3367397d5dc99fedca001"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_5Pn9UFsVwJoAkYd4DdMs_/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "f1d10ab5318816e6a0eb02dee5badc6855a5be796e1f0c3aa5eb530750616397"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_5Pn9UFsVwJoAkYd4DdMs_/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21c79c9a3a38bef0803fdd287ae485548dc96525314196a520d4bdc0b3e5f703"
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
