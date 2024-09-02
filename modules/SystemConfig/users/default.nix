{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.option.users;
  inherit (lib) mkOption types mkIf mkMerge;
in {
  options.option.users = {
    name = mkOption {
      type = types.str;
      default = "nixos";
    };
    extgroups = mkOption {
      type = with types; listOf str;
      default = [];
    };
    shell = mkOption {
      type = types.package;
      default = pkgs.zsh;
    };
  };
  config = mkMerge [
    {
      users.users.${cfg.name} = {
        isNormalUser = true;
        description = "${cfg.name}";
        extraGroups = ["networkmanager" "wheel"] ++ cfg.extgroups;
        packages = with pkgs; [
          firefox
          #  thunderbird
        ];
        shell = cfg.shell;
      };
    }
    (mkIf (cfg.shell == pkgs.zsh) {
      programs.zsh.enable = true;
    })
  ];
}
