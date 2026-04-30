class Seetree < Formula
  desc "Live terminal tree viewer that lights up as Claude Code edits files"
  homepage "https://github.com/ramonclaudio/seetree"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ramonclaudio/seetree/releases/download/v0.1.0/seetree-aarch64-macos"
      sha256 "da3f2481d0ff887ee70fa780e7bed30fa7cca5e117cceeadc521802072c3c80f"
    end
    on_intel do
      url "https://github.com/ramonclaudio/seetree/releases/download/v0.1.0/seetree-x86_64-macos"
      sha256 "18521459773da33daa37f0183e89f5f0cc163f41ef3fd145c68294be558037bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ramonclaudio/seetree/releases/download/v0.1.0/seetree-aarch64-linux-musl"
      sha256 "4921c4ec2bc731f755bd72ac58a04d93b71c922b0078ad8bc2b0fbc805bfaa88"
    end
    on_intel do
      url "https://github.com/ramonclaudio/seetree/releases/download/v0.1.0/seetree-x86_64-linux-musl"
      sha256 "bc0b3a3601bfe9a4f8167ae397ebf637385cd0d0c912298c890405e6b8d583db"
    end
  end

  resource "extras" do
    url "https://github.com/ramonclaudio/seetree/releases/download/v0.1.0/seetree-extras.tar.gz"
    sha256 "0c89ae0d816a480a907260d34ff527eb3df1edcfc95ca0530efc6a5f8019df07"
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
