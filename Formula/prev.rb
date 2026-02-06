class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.2.1/prev-darwin-arm64"
      sha256 "ca62a6780958d32b3038e60aa955904583063148cc4e0c11f2c9290967570d20"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.2.1/prev-darwin-amd64"
      sha256 "bfda863bebbe27ffcdacdaf1cac2fe49302160b84a6985e3edeb4ee986cacddd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.2.1/prev-linux-arm64"
      sha256 "071bae833aac1edbe7032dd17e13eca8faac066e7ad5ac4fe0dba77ae0de8f90"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.2.1/prev-linux-amd64"
      sha256 "91cc8ca75e16ba7926273cbe11001fe0b6d175aacb46a342df744fbeb461cd62"
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
