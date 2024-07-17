{
  appimageTools,
  fetchurl,
  lib,
  ...
}:
appimageTools.wrapType2 {
  pname = "badlion-client";
  version = "latest";

  src = fetchurl {
    url = "https://client-updates-cdn77.badlion.net/BadlionClient";
    hash = "sha256-9elNLSqCO21m1T2D+WABKotD9FfW3FrcOxbnPdyVd+w=";
  };
}
