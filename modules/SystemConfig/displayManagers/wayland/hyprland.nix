{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.option.wm.hyprland;
  inherit (lib) mkIf mkOption mkEnableOption types;
in {
  options.option.wm.hyprland = {
    enable = mkEnableOption "Enable Hyprland Window Manager";
    package = mkOption {
      type = types.package;
      default = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };
  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = cfg.package;
    };
  };
}
