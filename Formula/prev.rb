class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.3.0/prev-darwin-arm64"
      sha256 "6e8b5156fdcfebbff2a86e2348432bf431a98df4c34b30b96746db6f2fe9d526"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.3.0/prev-darwin-amd64"
      sha256 "53a4d057e2141842df39129ba65048635b19f02fdc884c0bc206622adf61a2b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.3.0/prev-linux-arm64"
      sha256 "214ab36c842d07c15662b162cd985616d3553be3c10c97205e55a604455212a9"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.3.0/prev-linux-amd64"
      sha256 "274fcfd62d5f004b6956fad4075ab280a390e7b4e87d523f941d477050fb9cc2"
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
