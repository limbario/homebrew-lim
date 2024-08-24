class AdbRequirement < Requirement
  fatal true

  satisfy(build_env: false) { which("adb") }

  def message
    <<~EOS
      adb is required to use lim.
      You can install it via Android Studio or with:
        brew install --cask android-platform-tools
    EOS
  end
end

class Lim < Formula
  desc "Get remote Android instances for local development and testing"
  homepage "https://limbar.io"
  version "v0.7.2"
  license "Proprietary"

  depends_on AdbRequirement
  depends_on "scrcpy"

  def caveats
    <<~EOS
      Get started with:
        lim create android
    EOS
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/limbario/homebrew-lim/releases/download/#{version}/lim-darwin-arm64"
      sha256 "95498ffc2c73fd9601fdb9c43c5a7581ef4ffedcbf895c434da04bd13daf684b" # replace_with_darwin_arm64_sha256
    else
      url "https://github.com/limbario/homebrew-lim/releases/download/#{version}/lim-darwin-amd64"
      sha256 "0f8a110dbf043539bb5a43f93fd9193f14dd95fa212f93dbfd20620e8f1ebe9b" # replace_with_darwin_amd64_sha256
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/limbario/homebrew-lim/releases/download/#{version}/lim-linux-arm64"
      sha256 "8899ce14264db190fd759bb35f14bf0eb8dfc1e9566e903530b52348dcfa603d" # replace_with_linux_arm64_sha256
    else
      url "https://github.com/limbario/homebrew-lim/releases/download/#{version}/lim-linux-amd64"
      sha256 "6bac57453ea2caa5ef10883277ef7392a666507f2f9f1de2b379c492f3c74e62" # replace_with_linux_amd64_sha256
    end
  end

  def install
    binary_name = "lim"
    binary_path = "lim"

    if OS.mac?
      binary_path = Hardware::CPU.arm? ? "lim-darwin-arm64" : "lim-darwin-amd64"
    elsif OS.linux?
      binary_path = Hardware::CPU.arm? ? "lim-linux-arm64" : "lim-linux-amd64"
    end

    bin.install binary_path => binary_name
  end

  test do
    system "#{bin}/lim", "--version"
  end
end
