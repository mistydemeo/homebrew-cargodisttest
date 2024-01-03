class Axolotlsay < Formula
  desc "💬 a CLI for learning to distribute CLIs in rust"
  version "0.2.81"
  on_macos do
    url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_fvRn4zI4S_cR_c06nUCL4/axolotlsay-x86_64-apple-darwin.tar.gz"
    sha256 "3bc5b2b982dd648413765a875743d754e66170e29e155145a5876935b93c9f13"
  end
  on_linux do
    on_intel do
      url "https://mistydemeo.artifacts.axodotdev.host/axolotlsay/ax_fvRn4zI4S_cR_c06nUCL4/axolotlsay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65afd92048f7a6eb8c243ccffd7ff7a7a4989c83758a34258a564e9d19101d9b"
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
