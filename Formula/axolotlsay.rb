class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.39/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "1537f7e1226dc1581e851ee01c9308bc4f400d5fc335f1c2b3777f3237bbc269"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.39/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "9b2b663b79be208dfc2cdcdfcc4b44efe5e096bed887d1080a2efe61b18fb765"
  end
  version "0.1.39"
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
