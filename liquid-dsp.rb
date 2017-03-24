require "formula"

class LiquidDsp < Formula
  homepage "http://liquidsdr.org/"
  head "https://github.com/jgaeddert/liquid-dsp.git"
  url "https://github.com/jgaeddert/liquid-dsp.git", :tag => "v1.3.0"

  depends_on "fftw"
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build

  def install
    system "./bootstrap.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
