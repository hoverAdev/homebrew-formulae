class FloatingIps < Formula
  desc "Floating IPS is a patcher for IPS and BPS files."
  homepage "https://git.disroot.org/Sir_Walrus/Flips"
  license "GPL-3.0-or-later"
  head "https://git.disroot.org/Sir_Walrus/Flips.git"
  url "https://git.disroot.org/Sir_Walrus/Flips/archive/v198.tar.gz"
  sha256 "362fb25a1c87cdd66a534dce61c546aac0fde55169b9745208702e55f5e94e2f"

  depends_on "gtk+3"

  def install
    ENV["TARGET"] = "gtk"
    system "./make-macos.sh", "--harden=yes", "--profile=no" 
    system "make", "install", "BINDIR=#{bin}", "DATAROOTDIR=#{share}"
  end

  test do
    system "flips --help"
  end
end
