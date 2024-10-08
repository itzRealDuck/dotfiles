{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.option.programs.zsh;
  inherit (lib) mkEnableOption mkIf mkOption mkMerge;
in {
  options.option.programs.zsh = {
    enable = mkEnableOption "Enable Zsh";
    aliases = mkOption {
      default = {
      };
    };
  };
  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion = {
        enable = true;
        highlight = "fg=#228B22,bold,underline";
      };
      shellAliases = mkMerge [
        {
          fs = "fastfetch";
          nf = "neofetch";
          set-volume = "wpctl set-volume @DEFAULT_SINK@";
        }

        cfg.aliases
      ];
    };
  };
}
