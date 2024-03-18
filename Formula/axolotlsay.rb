class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.114"
  on_macos do
    on_arm do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.114/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "40f54d677ebcf1cd44b349f61c16764ddc457e56da4425803ff9c6c9ccb7038a"
    end
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.114/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "0a1b760dedad3caa3420c6bb561cb8a29fee59e07741756052b05a9ddc9ef438"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.114/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d4d88d83f1bdc2add5aea4233429ca2183b5e76aa98769a2e17c67bc0f8f6b55"
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
