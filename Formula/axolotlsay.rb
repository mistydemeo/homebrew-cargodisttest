class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.51/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "8d3e4f559683cc3143fe2fec5ff854003a5a71d359eac0aad2b9cd8996a94656"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.51/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "ed5714497125d149dc3863fdd42437e0c0aeb6d37f1202a8786561ce43f7d40a"
  end
  version "0.1.51"
  license "MIT OR Apache-2.0"

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
