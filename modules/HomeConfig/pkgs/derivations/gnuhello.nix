{
  stdenv,
  fetchurl,
  lib,
  ...
}: {
  hello = stdenv.mkDerivation {
    pname = "hello";
    version = "2.12.1";

    src = fetchurl {
      url = "https://ftp.gnu.org/gnu/hello/hello-2.12.1.tar.gz";
      sha256 = "086vqwk2wl8zfs47sq2xpjc9k066ilmb8z6dn0q6ymwjzlm196cd";
    };

    buildInputs = [stdenv.cc];

    meta = {
      description = "A program that produces a familiar, friendly greeting";
      homepage = "https://www.gnu.org/software/hello/manual/";
      license = lib.licenses.gpl3Plus;
    };
  };
}
