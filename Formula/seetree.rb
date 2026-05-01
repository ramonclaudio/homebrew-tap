class Seetree < Formula
  desc "Tiny terminal tree viewer and Claude Code companion"
  homepage "https://github.com/ramonclaudio/seetree"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ramonclaudio/seetree/releases/download/v0.1.1/seetree-aarch64-macos"
      sha256 "cbfcae714b96026ae76f486df3a2262bee51a652b129415edbd3a8d80376aa71"
    end
    on_intel do
      url "https://github.com/ramonclaudio/seetree/releases/download/v0.1.1/seetree-x86_64-macos"
      sha256 "cecc03409b46c9beb423fd41604b1856207a6b5ee4af33b6ea246a0c3663d1e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ramonclaudio/seetree/releases/download/v0.1.1/seetree-aarch64-linux-musl"
      sha256 "09b2108a324fc0b670df0fc7333e410f9f1200ea2bcbdee6bae4c234b3e89d31"
    end
    on_intel do
      url "https://github.com/ramonclaudio/seetree/releases/download/v0.1.1/seetree-x86_64-linux-musl"
      sha256 "59db3bf13ba4bb34d7c8ba47e5ae651f350aface88af389f79039179482c0d7e"
    end
  end

  resource "extras" do
    url "https://github.com/ramonclaudio/seetree/releases/download/v0.1.1/seetree-extras.tar.gz"
    sha256 "e55cf642fa2b452515516258f9edd82cf70a2ec1ae28b2f165403b7963f5ff60"
  end

  def install
    binary = Dir["seetree-*"].first
    bin.install binary => "seetree"

    resource("extras").stage do
      bash_completion.install "completions/seetree.bash" => "seetree"
      zsh_completion.install "completions/_seetree"
      fish_completion.install "completions/seetree.fish"
      man1.install "man/seetree.1"
    end
  end

  test do
    assert_match "seetree", shell_output("#{bin}/seetree --version")
  end
end
