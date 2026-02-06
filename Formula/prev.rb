class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.2.6/prev-darwin-arm64"
      sha256 "53e423a208077025e3f7cefd468fb747ab036e1d7905033cef005207b6579316"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.2.6/prev-darwin-amd64"
      sha256 "ce48122721c4845e3b1cdce3f5fddfd3c4db5144459963a7911d22ff3035db7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.2.6/prev-linux-arm64"
      sha256 "2b67662a007a68de7a0e269476ed4979b8df4e760f3c7630ad0cce0f7aa89006"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.2.6/prev-linux-amd64"
      sha256 "c6ebeed7b28c9351e0ddf4f2f6c6a4d660b234bd1524b19503680314e14ff430"
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
