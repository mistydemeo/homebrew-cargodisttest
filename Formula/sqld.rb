class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/mistydemeo/sqld-test/releases/download/v0.18.5/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "27ff74cb6d21aa6b18f9c550e0bc977097cc3751a44d110ae67f047a222df45c"
  else
    url "https://github.com/mistydemeo/sqld-test/releases/download/v0.18.5/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "bd15c3898bac5818a56a1b6e9109701681a2074897de96f6fc9e58c52b039a16"
  end
  version "0.18.5"

  def install
    bin.install "sqld"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end