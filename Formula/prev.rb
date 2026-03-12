class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.8.0/prev-darwin-arm64"
      sha256 "841eb32f3afd74355b56b0c8f397f9fadfb7c2b0c9e64b891883a4dec0e9b9c9"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.8.0/prev-darwin-amd64"
      sha256 "b68ef9669dbfbaab47f2541825df6e60f9e437af1dfa405128b44593c49b9a26"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.8.0/prev-linux-arm64"
      sha256 "8210028c5fc13c7c003e7274f818ee799ff98ec7518d9ecf64bbefdabcecd69d"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.8.0/prev-linux-amd64"
      sha256 "b6266c3581f1265ca8a70984b0aad44effbaa1f433f7564ce0bdb42f92405539"
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
