{
  pkgs,
  options,
  lib,
  config,
  ...
}: let
  cfg = config.option.programs.alacritty;
  inherit (lib) mkIf mkMerge mkEnableOption types mkOption;
  tomlFormat = pkgs.formats.toml {};
in {
  options.option.programs.alacritty = {
    enable = mkEnableOption "Enable Alacritty";
    oxocarbon = {
      enable = mkEnableOption "OxoCarbon Theme for Alacritty";
    };
    nord = {
      enable = mkEnableOption "Nord Theme for Alacritty";
    };
    catppuccin = {
      enable = mkEnableOption "Catppuccin Theme for Alacritty";
      flavor = mkOption {
        type = types.str;
        default = "macchiato";
      };
    };
    config = mkOption {
      type = tomlFormat.type;
      default = {};
    };
  };
  config = mkMerge [
    (mkIf cfg.oxocarbon.enable
      {
        programs.alacritty.settings = {
          colors.primary.background = "#171717";
        };
      })
    (mkIf cfg.nord.enable {
      programs.alacritty.settings = {
        colors.primary.background = "#3B4252";
      };
    })
    (mkIf cfg.enable {
      programs.alacritty = {
        enable = true;
        package = pkgs.alacritty;
        catppuccin = {
          enable = cfg.catppuccin.enable;
          flavor = cfg.catppuccin.flavor;
        };
        settings = cfg.config;
      };
    })
  ];
}
