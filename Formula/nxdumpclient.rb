class Nxdumpclient < Formula
  desc "A client program for dumping over USB with nxdumptool"
  homepage "https://github.com/v1993/nxdumpclient"
  url "https://github.com/v1993/nxdumpclient/archive/refs/tags/v1.1.4.tar.gz"
  sha256 "114b1b303063611bfbba247f03c5d93e2f4cc9f03711a693b1ccb5509b0b66c1"
  license "GPL-3.0"
  head "https://github.com/v1993/nxdumpclient.git", branch: "main"

  depends_on "gtk4"
  depends_on "libadwaita"
  depends_on "glib"
  depends_on "libgusb"

  depends_on "meson" => :build
  depends_on "blueprint-compiler" => :build
  depends_on "vala" => :build
  depends_on "cmake" => :build
  depends_on "desktop-file-utils" => :build
  depends_on "appstream-glib" => :build
  depends_on "ninja" => :build

  def install
    system "meson", "setup", "-Db_lto=true", *std_meson_args, "build"
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"    
  end

  test do
    system "nxdumpclient --help"
  end
end
