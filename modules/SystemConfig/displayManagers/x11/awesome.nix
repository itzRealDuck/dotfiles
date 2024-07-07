{
  options,
  inputs,
  pkgs,
  lib,
  ...
}:
with options; {
  services.xserver.windowManager = {
    awesome = {
      enable = true;
      package = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-git;

      luaModules = lib.attrValues {
        inherit (pkgs.luaPackages) lgi ldbus luadbi-mysql luaposix;
      };
    };
  };
}
