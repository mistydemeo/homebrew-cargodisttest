class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.5/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "8e4ace78c7ec16b688bbf6152d5e17b345f555acdb2624855db21ecc30c7904e"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.5/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "336c2858b1620574b4471a70072bf5ab1e710ca45e5d18c7c10a2b175fbd6769"
  end
  version "0.2.5"
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
