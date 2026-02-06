class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.2.3/prev-darwin-arm64"
      sha256 "e4c3e02bb2588fb96618bdbef75549a48337a3eb3c1dbd31152396b5af5dcc8d"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.2.3/prev-darwin-amd64"
      sha256 "be1c9c300e561967e28a2a4c211bf78b0007a5e59c967f1a3acb0c90496c02c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.2.3/prev-linux-arm64"
      sha256 "f8cee3d1f16130fc930fe96cca2d817b8751f49c993a1d6e2b0a77fb088921a9"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.2.3/prev-linux-amd64"
      sha256 "660a8e5dc540cccaa3525361f751bce3e747f40bfeb7f239035f36892dce7068"
    end
  end

  def install
    binary = Dir["prev-*"].first || "prev"
    mv binary, "prev" if binary != "prev"
    bin.install "prev"
  end

  test do
    assert_match "prev", shell_output("#{bin}/prev --version")
  end
end
