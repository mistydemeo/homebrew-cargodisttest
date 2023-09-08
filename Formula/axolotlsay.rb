class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.42/axolotlsay-aarch64-apple-darwin.tar.gz"
    sha256 "e1fe73b1b081612f0af3df956be85d7a73370d1573a7fa562b4639d62afa3979"
  else
    url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.1.42/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "3f36e822a1b9d38e5cd1199047f88dafc81bb8862560a7a80d40e51ed99b9a48"
  end
  version "0.1.42"
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
