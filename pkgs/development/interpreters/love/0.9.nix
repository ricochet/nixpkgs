{ lib, stdenv, fetchurl, pkg-config
, SDL2, libGLU, libGL, openal, luajit
, libdevil, freetype, physfs
, libmodplug, mpg123, libvorbis, libogg
}:

stdenv.mkDerivation rec {
  pname = "love";
  version = "0.9.1";

  src = fetchurl {
    url = "https://bitbucket.org/rude/love/downloads/love-${version}-linux-src.tar.gz";
    sha256 = "1pikd0bzb44r4bf0jbgn78whz1yswpq1n5jc8nf87v42pm30kp84";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    SDL2 libGLU libGL openal luajit
    libdevil freetype physfs libmodplug mpg123 libvorbis libogg
  ];

  configureFlags = [
    "--with-lua=luajit"
  ];

  NIX_CFLAGS_COMPILE = [ "-DluaL_reg=luaL_Reg" ]; # needed since luajit-2.1.0-beta3

  meta = {
    homepage = "http://love2d.org";
    description = "A Lua-based 2D game engine/scripting language";
    license = lib.licenses.zlib;

    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.raskin ];
    broken = true;
  };
}
