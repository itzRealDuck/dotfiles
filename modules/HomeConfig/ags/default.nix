{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.option.programs.ags;
  inherit (lib) mkEnableOption mkIf;
in {
  options.option.programs.ags = {
    enable = mkEnableOption "Enable Ags";
  };
  config = mkIf cfg.enable {
    programs.ags = {
      enable = true;

      configDir = null;

      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
      ];
    };
  };
}
