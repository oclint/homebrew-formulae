class Oclint < Formula
  desc "OCLint static code analysis tool for C, C++, and Objective-C"
  homepage "http://oclint.org"
  version '0.12'
  sha256 '12fda8c59ddd1896880a3055b701850d89550ea686b8d82aa94fffb74220950d'
  url "https://github.com/oclint/oclint/releases/download/v#{version}/oclint-#{version}-x86_64-darwin-16.5.0.tar.gz"
  head "https://github.com/oclint/oclint.git"

  def install
    clang_version = '4.0.0'

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
