class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.104"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_9PbploT2IaoEFedn0IlBr/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "13bbd02dee6224e106345d3263c6a6405df7cd22d19277af7930025fd4f5e102"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_9PbploT2IaoEFedn0IlBr/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "b8066febb4a8e3a90f24d129ef6308c827d72eada4132c9f854cb310bb7beceb"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_9PbploT2IaoEFedn0IlBr/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7ce83f065410ce2838b715abf35275b6770f5e52ce092806fb7c2521b38f446"
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
