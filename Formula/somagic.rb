class Somagic < Formula
  desc "Linux capture program for the Somagic variants of EasyCAP"
  homepage "https://code.google.com/p/easycap-somagic-linux/"
  url "https://easycap-somagic-linux.googlecode.com/files/somagic-easycap_1.1.tar.gz"
  sha256 "3a9dd78a47335a6d041cd5465d28124612dad97939c56d7c10e000484d78a320"

  bottle do
    cellar :any
    sha256 "ed8a82423daaabaca0a7ab203edc68b3c0a1a1d617eb24d46486dfa974e9eb4f" => :el_capitan
    sha256 "9c87f9d7a694509b446ce726cedcb731c0185b589a1cdfa96c0346f883a75e5d" => :yosemite
    sha256 "0684417c6e1f1b498d10c5d24171217fb2e70ed0c8f9bacdd7365e8be8af20fc" => :mavericks
  end

  depends_on "libusb"
  depends_on "libgcrypt"
  depends_on "somagic-tools"
  depends_on "mplayer" => :optional

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end

  def caveats; <<-EOS.undent
      Before running somagic-capture you must extract the official firmware from the CD.
      See https://code.google.com/p/easycap-somagic-linux/wiki/GettingStarted#Extracting_firmware for details.
    EOS
  end
end
