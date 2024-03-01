class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.109"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_CO0R5ao81UoGOWIrfs8OB/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "95d8ff00e99c97f60fe70b82118875fa4da7a89d3aa27faed0b313e729c531e1"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_CO0R5ao81UoGOWIrfs8OB/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "54843ee5c16d87a9fb4b7bb8a19c37c71b1e0df98ac40a5ddeb86fee9e07c11e"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_CO0R5ao81UoGOWIrfs8OB/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8572e973e0bce68f63e5eae1aaa9836ffd5f224c0cd166ed63dc154d20ed906d"
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
