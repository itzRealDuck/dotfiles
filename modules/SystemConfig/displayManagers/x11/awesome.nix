{
  inputs,
  pkgs,
  lib,
  ...
}: {
  services.xserver.windowManager = {
    awesome = {
      enable = true;
      # package = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-git;
      package = pkgs.awesome;

      luaModules = lib.attrValues {
        inherit (pkgs.luaPackages) lgi ldbus luadbi-mysql luaposix;
      };
    };
  };
}
