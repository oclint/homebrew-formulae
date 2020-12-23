class Oclint < Formula
  desc "OCLint static code analysis tool for C, C++, and Objective-C"
  homepage "http://oclint.org"
  version '20.11'
  sha256 'c5167061ff162b791b73754963e3c2f9c545fe3e66b111cc842392cf0c987caf'
  url "https://github.com/oclint/oclint/releases/download/v#{version}/oclint-#{version}-llvm-11.0.0-x86_64-darwin-macos-big-sur-11.0.1-xcode-12.2.tar.gz"
  head "https://github.com/oclint/oclint.git"

  def install
    clang_version = '11.0.0'

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
