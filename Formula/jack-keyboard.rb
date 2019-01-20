class JackKeyboard < Formula
  desc "Virtual MIDI keyboard for Jack"
  homepage "https://jack-keyboard.sourceforge.io"
  url "https://downloads.sourceforge.net/project/jack-keyboard/jack-keyboard/2.7.2/jack-keyboard-2.7.2.tar.gz"
  sha256 "59953c996aa057146d4ccb7697d846dad87c3e7c4e3b05eeea6f47f3837a64fc"

  depends_on "cmake" => :build
  depends_on "gtk+"

  def install
    args = %w[
      -DLashEnable=OFF
      -DX11Enable=OFF
    ]

    inreplace "CMakeLists.txt", "DESTINATION man/man1",
              "DESTINATION share/man/man1"

    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jack-keyboard -V 2>&1")
  end
end
