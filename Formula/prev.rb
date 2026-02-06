class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.2.2/prev-darwin-arm64"
      sha256 "6222f5a3faa0b3587a31519a47246ee3fe3920c0b78fc054174a64a4b7fa778f"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.2.2/prev-darwin-amd64"
      sha256 "420cca4857959e943ef7e4079abbe3359526f643d9f7a2d54c4bdcd1939b8bf0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.2.2/prev-linux-arm64"
      sha256 "e3cecbd06a6de8643ec4a7a2c774f5641e7bd448a824a3337fa59bd656eddab8"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.2.2/prev-linux-amd64"
      sha256 "b2fe1e696609c7e384b456364ff14214599e759445a969b7a9f010a834386371"
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
