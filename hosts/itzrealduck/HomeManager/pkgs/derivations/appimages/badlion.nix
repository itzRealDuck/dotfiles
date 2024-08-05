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
    hash = "sha256-yR/Ko8moUWDVyZ9tKj7ZF8KYpcDtbwMvel/UBWNgehU=";
  };
}
