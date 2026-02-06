class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.2.7/prev-darwin-arm64"
      sha256 "a8f662edc6e3a4cbbbe6952af6bd2817eb04ed1ae0748e227e993006fbd2cf4c"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.2.7/prev-darwin-amd64"
      sha256 "8611561eb859bb490ef3e4f68096ff4030b57a174b530458e4b687848bc721d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.2.7/prev-linux-arm64"
      sha256 "208df48a733fa29d557645dc67e038a2c45cede6864d87709f311f1e124cea74"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.2.7/prev-linux-amd64"
      sha256 "a65b5677048f363b8ed518443fc9356100858722f8bc08d66f726c86e2108149"
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
