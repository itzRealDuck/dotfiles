{
  config,
  lib,
  ...
}: let
  cfg = config.option.programs.nh;
  inherit (lib) mkEnableOption mkIf mkOption types;
in {
  options.option.programs.nh = {
    enable = mkEnableOption "Enable nh";
    flake = mkOption {
      type = types.str;
      default = "/etc/nixos";
    };
  };
  config = mkIf cfg.enable {
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "-d";
      };
      flake = cfg.flake;
    };
  };
}
