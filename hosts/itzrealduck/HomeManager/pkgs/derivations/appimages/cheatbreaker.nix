{
  appimageTools,
  fetchurl,
  lib,
  makeWrapper,
  ...
}:
appimageTools.wrapType2 rec {
  pname = "cheatbreaker";
  version = "2.5.5";

  src = fetchurl {
    url = "https://r2.cheatbreaker.net/Launcher/master/Linux/amd64/CheatBreaker.AppImage";
    hash = "sha256-X/aAGcoWybQGLw4l9UMx4DZfG76ojOInV8ny3LgCik0";
  };
  extraInstallCommands = let
    contents = appimageTools.extract {inherit pname version src;};
  in ''
    source "${makeWrapper}/nix-support/setup-hook"
    wrapProgram $out/bin/cheatbreaker \
      --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"
    install -Dm444 ${contents}/cheatbreaker.desktop $out/share/applications/cheatbreaker.desktop
    install -Dm444 ${contents}/cheatbreaker.png $out/share/pixmaps/cheatbreaker.png
    substituteInPlace $out/share/applications/cheatbreaker.desktop \
      --replace 'Exec=AppRun --no-sandbox %U' 'Exec=cheatbreaker' \
      --replace 'Icon=launcher' 'Icon=cheatbreaker'
  '';
}
