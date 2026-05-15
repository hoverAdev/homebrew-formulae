# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Nxdumpclient < Formula
  desc "A client program for dumping over USB with nxdumptool"
  homepage "https://github.com/v1993/nxdumpclient"
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
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test nxdumpclient`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "true"
  end
end
