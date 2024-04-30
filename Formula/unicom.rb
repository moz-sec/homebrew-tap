VERSION="0.1.0"
PRODUCT="unicom"
class Unicom < Formula
  desc "unicom is Universal Compressor"
  homepage "https://github.com/moz-sec/unicom"
  version VERSION
  license "MIT"
  option "without-completions", "Disable bash completions"
  depends_on "bash-completion@2" => :optional
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/moz-sec/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_darwin_amd64.tar.gz"
    sha256 "3480085e8ef64704af77b1bbd7341855ddd77d92f1b16bb1113bb60c1e06337c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/moz-sec/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_darwin_arm64.tar.gz"
    sha256 "09ea0e34ef9e3d7194aa079f0516b849b735424875cb082a9643062a652fb432"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/moz-sec/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_amd64.tar.gz"
    sha256 "ab1fca75661dca5a921605e9e71a50cdd45a92e9e602abf13f17afc8efb62c95"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/moz-sec/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_arm64.tar.gz"
    sha256 "6501b6647a2273a3f570340f5b4c147ffae7dfae3e161a809db129d74c9d95e4"
  end
end
def install
  bin.install "unicom"
  bash_completion.install "completions/unicom-completions.bash" if build.with? "completions"
  fish_completion.install "completions/unicom-completions.fish" if build.with? "completions"
  zsh_completion.install "completions/_unicom" if build.with? "completions"
end test do
  system "#{bin}/unicom --version"
done
