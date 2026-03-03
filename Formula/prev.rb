class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.6.0/prev-darwin-arm64"
      sha256 "25c59d3488f9956df2c8badbb9eca5478c3c67b02bba35f64ef7bdf14616b335"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.6.0/prev-darwin-amd64"
      sha256 "a9a7cc362b0d014b5b38fd6032fbecc03b40c0288d7e84b36aec65748edcb790"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.6.0/prev-linux-arm64"
      sha256 "0c6f91f8c7b3071e3261e552e34ef3190aee072ec6d27df18b0c6c360cc2ddfd"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.6.0/prev-linux-amd64"
      sha256 "58dd0b063bead37fdb8cfb2769318ee62f2c69215c531bfe53706c7cbbff2834"
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
