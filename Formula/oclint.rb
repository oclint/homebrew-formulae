class Oclint < Formula
  desc "OCLint static code analysis tool for C, C++, and Objective-C"
  homepage "http://oclint.org"
  version '0.10.3'
  sha256 '533b4fdc82664a3d3dede3820fee664c71c3fba2bef4ba096a37ec9c5fc2dae5'
  url "https://github.com/oclint/oclint/releases/download/v#{version}/oclint-#{version}-x86_64-darwin-15.5.0.tar.gz"
  head "https://github.com/oclint/oclint.git"

  def install
    clang_version = '3.8.0'

    include.install Dir['include/c++'] unless File.directory? "#{include}/c++"
    "#{include}/c++".install Dir['include/c++/v1'] unless File.directory? "#{include}/c++/v1"
    lib.install Dir['lib/clang'] unless File.directory? "#{lib}/clang"
    "#{lib}/clang".install Dir['lib/clang/#{clang_version}'] unless File.directory? "#{lib}/clang/#{clang_version}"
    lib.install Dir['lib/oclint']
    bin.install Dir['bin/*']
  end

  test do
    system "#{bin}/oclint", "-version"
  end
end
