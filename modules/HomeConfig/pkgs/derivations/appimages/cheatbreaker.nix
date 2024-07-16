{
  appimageTools,
  fetchurl,
  lib,
  ...
}:
appimageTools.wrapType2 {
  pname = "cheatbreaker";
  version = "2.5.5";

  src = fetchurl {
    url = "https://r2.cheatbreaker.net/Launcher/master/Linux/amd64/CheatBreaker.AppImage";
    hash = "sha256-X/aAGcoWybQGLw4l9UMx4DZfG76ojOInV8ny3LgCik0";
  };
}
