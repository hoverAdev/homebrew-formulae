class MipsLinuxGnuBinutils < Formula
  desc "GNU binutils for the N64 mips-linux-gnu target"
  homepage "https://www.gnu.org/software/binutils/"
  url "https://ftp.gnu.org/gnu/binutils/binutils-2.46.1.tar.xz"
  mirror "https://ftpmirror.gnu.org/binutils/binutils-2.46.1.tar.xz"
  sha256 "e127a709cba24c76de8936cb7083dd768f28cd37eb010492e2f19b71eb1294e4"
  head "git://sourceware.org/git/binutils-gdb.git", branch: "master"

  depends_on "gettext"
  depends_on "texinfo"
  depends_on "zstd"

  uses_from_macos "zlib"

  def version_suffix
    if build.head?
      "HEAD"
    else
      version.to_s.slice(/\d/)
    end
  end

  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --enable-deterministic-archives
      --prefix=#{prefix}
      --includedir=#{include}/mips-linux-gnu-binutils/#{version_suffix}
      --infodir=#{info}/mips-linux-gnu-binutils/#{version_suffix}
      --libdir=#{lib}/mips-linux-gnu-binutils/#{version_suffix}
      --mandir=#{man}/mips-linux-gnu-binutils/#{version_suffix}
      --target=mips-linux-gnu
      --with-arch=vr4300
      --disable-werror
      --enable-interwork
      --enable-multilib
      --enable-64-bit-bfd
      --enable-plugins
      --enable-targets=all
      --with-zstd
      --with-system-zlib
      --disable-nls
    ]

    mkdir "build" do
      system "../configure", *args
      system "gmake"
      system "gmake", "install"
    end

  end

  test do
    system "#{bin}/mips-linux-gnu-ar", "--version"
    system "#{bin}/mips-linux-gnu-as", "--version"
    system "#{bin}/mips-linux-gnu-ld", "--version"
    system "#{bin}/mips-linux-gnu-objcopy", "--version"
    system "#{bin}/mips-linux-gnu-objdump", "--version"
  end
end
