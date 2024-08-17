class Limbar < Formula
  desc "Get remote Android instances for local development and testing"
  homepage "https://limbar.io"
  version "v0.7.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/limbario/homebrew-lim/releases/download/#{version}/lim-#{version}-darwin-arm64.tar.gz"
      sha256 "2b0cfeb469aa36cfed192cd786d759ba2ebc962fb2fb32124fb497bae137168d" # replace_with_darwin_arm64_sha256
    else
      url "https://github.com/limbario/homebrew-lim/releases/download/#{version}/lim-#{version}-darwin-amd64.tar.gz"
      sha256 "a4d6e50570eb3b7f335b631d3daf0836239864c1827ef942b3125940009c3236" # replace_with_darwin_amd64_sha256
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/limbario/homebrew-lim/releases/download/#{version}/lim-#{version}-linux-arm64.tar.gz"
      sha256 "764b00d2c2d1aaeaea514ce0f003d85b345243e88aad037bd8abf3ffa0148e8d" # replace_with_linux_arm64_sha256
    else
      url "https://github.com/limbario/homebrew-lim/releases/download/#{version}/lim-#{version}-linux-amd64.tar.gz"
      sha256 "fe449a6ee85f6d4d63df7b652e91c69230b953def2e27558be99f4abfc028e1d" # replace_with_linux_amd64_sha256
    end
  end

  def install
    bin.install "lim"
  end

  test do
    system "#{bin}/lim", "--version"
  end
end
