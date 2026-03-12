class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.8.0/prev-darwin-arm64"
      sha256 "9c987dcd00300550c184831037bfe0b075db2362cff85d2b1dde932d1971cb5e"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.8.0/prev-darwin-amd64"
      sha256 "57d2ee3201df81f2f9712df16d446cda5ceade5dc83201afc1c7885b3806c535"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.8.0/prev-linux-arm64"
      sha256 "8fec8ecb3f1f4c1b5a982e62d60673186a46c4203671d3581defac90256b1e62"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.8.0/prev-linux-amd64"
      sha256 "08c547fc810d29131719ccf9fca738c911b79c5a4953e059a61f0eac05b4f073"
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
