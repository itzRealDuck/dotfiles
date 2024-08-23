{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.option.wm.awesome;
  inherit (lib) mkIf mkEnableOption mkOption types;
in {
  options.option.wm.awesome = {
    enable = mkEnableOption "Enable Awesome Window Manager";
    package = mkOption {
      type = types.package;
      default = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-git;
    };
  };
  config = mkIf cfg.enable {
    services.xserver.windowManager = {
      awesome = {
        enable = true;
        package = cfg.package;

        luaModules = lib.attrValues {
          inherit (pkgs.luaPackages) lgi ldbus luadbi-mysql luaposix;
        };
      };
    };
  };
}
