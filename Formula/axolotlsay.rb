class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.74"
  on_macos do
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.74/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "51e6e3053d4f46aff59a60abe92b7fd9b874cb85e25865f5f1e155dacda63e47"
  end
  on_linux do
    on_intel do
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.74/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c2ca156e3d3df07162ad53370bb022074301650538113f13f862ee286510994"
    end
  end
  license "MIT OR Apache-2.0"
  
  depends_on "libcue"

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
