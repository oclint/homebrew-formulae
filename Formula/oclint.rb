class Oclint < Formula
  desc "OCLint static code analysis tool for C, C++, and Objective-C"
  homepage "http://oclint.org"
  version '0.13.1'
  sha256 'c67f014a1ce997e62a242fe9154a9ac0a4ea50ad07b0417f3fb8b13f20e1ab90'
  url "https://github.com/oclint/oclint/releases/download/v#{version}/oclint-#{version}-x86_64-darwin-17.4.0.tar.gz"
  head "https://github.com/oclint/oclint.git"

  def install
    clang_version = '5.0.1'

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
