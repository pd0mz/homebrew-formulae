class Libvolk < Formula
  desc "Vector-Optimized Library of Kernels"
  homepage "http://libvolk.org/"
  url "http://libvolk.org/releases/volk-1.3.tar.gz"
  sha256 "90b69515d3cc6d76bbc589cec63d600b690bffe2e2938be2f895176f18f7e3af"

  depends_on "cmake" => :build
  depends_on "boost" => :build
  depends_on "doxygen" => :recommended
  depends_on "pkg-config" => :recommended

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      system "make", "install" # if this fails, try separate make/make install steps
    end
  end

  test do
    chdir "build" do
      system "make", "test"
    end
  end
end
