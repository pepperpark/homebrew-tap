class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.2.5/prev-darwin-arm64"
      sha256 "9779c0aa0cf0ce2f6bcd6a00a198791f7dfb19c033b4175276bf0998ae690820"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.2.5/prev-darwin-amd64"
      sha256 "7808587d4010a62afa7e98d6db87e9f720c7756a42ceb741235df76b08e49c41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v0.2.5/prev-linux-arm64"
      sha256 "2ad59a2410937e8c84ab64ab7804e99ee30af3b45eaf032d189377c2d8dc2be6"
    else
      url "https://github.com/pepperpark/apt/releases/download/v0.2.5/prev-linux-amd64"
      sha256 "38899e1b4e81e15d522282ed04a8ed934b3ca6249a9524db8f531012db8c4784"
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
