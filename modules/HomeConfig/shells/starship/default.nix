{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.option.programs.starship;
  inherit (lib) mkEnableOption mkIf importTOML mkOption types;
in {
  options.option.programs.starship = {
    enable = mkEnableOption "Enable Starship";
    catppuccin = {
      enable = mkEnableOption "Enable Catppuccin Theme For Starship";
      flavor = mkOption {
        type = types.str;
        default = "macchiato";
      };
    };
  };
  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      package = pkgs.starship;
      enableZshIntegration = true;
      catppuccin = {
        enable = cfg.catppuccin.enable;
        flavor = cfg.catppuccin.flavor;
      };
      settings = importTOML ../../../../non_nix_files/starship.toml;
    };
  };
}
