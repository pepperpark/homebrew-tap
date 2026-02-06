class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.2.4/prev-darwin-arm64"
      sha256 "5e9c602c84459fe5866297af3ef99d823567073e295eddac92b61694ac7e5b47"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.2.4/prev-darwin-amd64"
      sha256 "1c169c953a477c81ed19890ea94e3bd0e24f97206d4b2d6d02e32ba91b3e3ac0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.2.4/prev-linux-arm64"
      sha256 "bf61e4db60dcd745e6ac9ea38f6d93399a76d4647f7af58e8dc33d92f931ccc1"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.2.4/prev-linux-amd64"
      sha256 "749f5bcc0b7d5fa6d354f27018920ab28f68b4f148fd917eef25a7258dd2732f"
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
