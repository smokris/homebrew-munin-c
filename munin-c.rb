class MuninC < Formula
  desc "Resource monitoring agent"
  homepage "https://github.com/smokris/munin-c"
  url "https://github.com/smokris/munin-c/archive/refs/heads/macos-bsd.zip"
  sha256 "f9a9a5b95566cf090d6c9363b333c2a631cd0b59c5d0e81e4bb5760bc814bf82"
  version "0.1"

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    system "autoreconf", "-i", "-I", "m4"
    system "./configure"
    system "make"
    bin.install "src/node/munin-node-c"
    bin.install "src/plugins/munin-plugins-c"
  end

  test do
    system "#{bin}/munin-plugins-c", "listplugins"
  end
end
