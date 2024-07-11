{
  pkgs,
  options,
  lib,
  config,
  ...
}: {
  options.programs.alacritty = {
    oxocarbon = {
      enable = lib.mkEnableOption "OxoCarbon Theme for Alacritty";
    };
  };
  config = config.programs.alacritty.enable {
    programs.alacritty.settings = {
      colors.primary = "#FF0000";
    };
  };
}
