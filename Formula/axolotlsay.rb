class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  homepage "https://github.com/mistydemeo/cargodisttest"
  version "0.2.118"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.118/axolotlsay-aarch64-apple-darwin.tar.gz"
      sha256 "4899fad0ce17034ec97f0b522aa97e5b0fed7ccbc99d0129ec6572eb0ed76fe9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.118/axolotlsay-x86_64-apple-darwin.tar.gz"
      sha256 "2b8c26ac3fa5e1a4ba64fd3c94d9973f65532c06c82bf912c4f229f7dc9e41ea"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/mistydemeo/cargodisttest/releases/download/v0.2.118/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "571e3b9f2a579be0b16997941fcb01378928ac2feda1fa97ff8cff2529d706be"
    end
  end
  license "MIT OR Apache-2.0"

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "axolotlsay"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "axolotlsay"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "axolotlsay"
    end
    
    bin.install_symlink bin/"axolotlsay" => "cargodisttest" if (bin/"axolotlsay").exist?

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
