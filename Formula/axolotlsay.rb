class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.95"
  on_macos do
    on_arm do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_hLcvX-tKR9JoOPz9-UYYF/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "647040186e075b7c922528028633ca89aedea22a45667cd8e5686f5b1b880b34"
    end
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_hLcvX-tKR9JoOPz9-UYYF/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "adf87df1edf3b3b2bdc5a84bfeee6066b75e0e960c8f1b1fb9dac88d60b3359d"
    end
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_hLcvX-tKR9JoOPz9-UYYF/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b83d873677b83baa75e305142de0f5bda3958d82924ec747afd7e2c07c4c374"
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
