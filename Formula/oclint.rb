class Oclint < Formula
  desc "OCLint static code analysis tool for C, C++, and Objective-C"
  homepage "http://oclint.org"
  version '0.10.2'
  sha256 '908ff716be831f1842daf81f899d86b1ee56109656fc1b6ccd69f8806ffdb75c'
  url "https://github.com/oclint/oclint/releases/download/v#{version}/oclint-#{version}-x86_64-darwin-15.2.0.tar.gz"
  head "https://github.com/oclint/oclint.git"

  def install
    clang_version = '3.7.0'

    lib.install Dir['lib/clang'] unless File.directory? "#{lib}/clang"
    "#{lib}/clang".install Dir['lib/clang/#{clang_version}'] unless File.directory? "#{lib}/clang/#{clang_version}"
    lib.install Dir['lib/oclint']
    bin.install Dir['bin/*']
  end

  test do
    system "#{bin}/oclint", "-version"
  end
end
