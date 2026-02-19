class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.4.0/prev-darwin-arm64"
      sha256 "141a996ee917ba5b69399b853f7b62ad691f74bf6ff1e9a18debdf426e53a67f"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.4.0/prev-darwin-amd64"
      sha256 "a55ebb23b23c62d16938c55eaf7c1a359b4ee4e034b3392bdf4f8df3cab546b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.4.0/prev-linux-arm64"
      sha256 "e60819d57dc4970bda6fc8bb5584cc8d7926d16ef05137bcfadb53fbc0063aa1"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.4.0/prev-linux-amd64"
      sha256 "517f900d0d2e504491d06957b8222c5c180ce2dd19e71277b47e62a1fda22af7"
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
