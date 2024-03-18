class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.113"
  on_macos do
    on_arm do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.113/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "36cf12eefadaa3464cd4d47c49ae49ab538f586fc0c17f566b8dd2836f49eb1b"
    end
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.113/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "f22b514899f94744ee429f8a095b9cc1f762a64d245dfc683e3ef57f77df0fbe"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.113/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "305ad679fd695c8e9e46e60ae034aceff7d16c0a8953ce4a00eb190f954bfd75"
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
