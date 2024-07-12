{
  pkgs,
  options,
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkMerge mkEnableOption;
in {
  options.programs.alacritty = {
    oxocarbon = {
      enable = mkEnableOption "OxoCarbon Theme for Alacritty";
    };
    nord = {
      enable = mkEnableOption "Nord Theme for Alacritty";
    };
  };
  config = mkMerge [
    (mkIf config.programs.alacritty.oxocarbon.enable
      {
        programs.alacritty.settings = {
          colors.primary.background = "#171717";
        };
      })
    (mkIf config.programs.alacritty.nord.enable {
      programs.alacritty.settings = {
        colors.primary.background = "#3B4252";
      };
    })
  ];
}
