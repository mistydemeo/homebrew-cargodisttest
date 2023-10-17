class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.41/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "76295c895e34bc97ffd0f3edc89b5d410f701ae53d12d46fc9b0ffe32010e7c1"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.41/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "6b554c87c87ea49755c96d6f07f29d02a8881926bf36673c34109d3dc6dba04e"
  end
  version "0.2.41"
  license "MIT OR Apache-2.0"
  
  depends_on ""
  depends_on ""

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
