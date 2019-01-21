class Qtractor < Formula
  desc "Audio/MIDI multi-track sequencer application"
  homepage "https://qtractor.sourceforge.io"
  url "https://downloads.sourceforge.net/qtractor/qtractor-0.9.3.tar.gz"
  sha256 "e1d0ce9d8067462ce6efa1e0440d6d13689a82149d9b175e1ab3fdf6e77e2080"

  depends_on "pkg-config" => :build
  depends_on "jack"
  depends_on "qt5"

  def install
    system "./configure", "--disable-debug",
                          "--without-alsa",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test qtractor`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
