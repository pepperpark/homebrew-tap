class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.7.0/prev-darwin-arm64"
      sha256 "638b75b291c6cbe9123b38209d47a246fef8a8e310c0c7939d1bb558f023fa5c"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.7.0/prev-darwin-amd64"
      sha256 "397d7b8a10f1699aec68da9d86f221e00d1685b887843035e9406c7804ae0749"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.7.0/prev-linux-arm64"
      sha256 "3ef0739243ab178ecd2386c7caffad4106084c72d1e4843bc14610048a3798b3"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.7.0/prev-linux-amd64"
      sha256 "a0c618462624f81c7377033dc0cd5746cefd3a024634a5b1fd0cc31a09449466"
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
