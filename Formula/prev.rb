class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.5.0/prev-darwin-arm64"
      sha256 "3d4bd9b494d733357db0c4490e882e16ab3704a2bbb67ed778cf94dc2274c867"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.5.0/prev-darwin-amd64"
      sha256 "422f2c6cf5f8b974ee0eacaa17e13926aa8bcaa8167254cda9cffca1eb4625b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.5.0/prev-linux-arm64"
      sha256 "f0a10723eb3ac01cd18903010f2820f46b956cd80868a0be28dd79e247e2237e"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.5.0/prev-linux-amd64"
      sha256 "0fd5483c03fb65f575ee080e8f0bd882580490ddd5fef7dd15077b91dc84fdff"
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
