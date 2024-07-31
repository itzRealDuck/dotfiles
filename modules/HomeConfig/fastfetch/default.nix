{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.option.programs.fastfetch;
  inherit (lib) mkEnableOption mkIf mkOption;
in {
  options.option.programs.fastfetch = {
    enable = mkEnableOption "Enable Fastfetch";
    cnfg = mkOption {
      default = {
      };
    };
  };
  config = mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;
      package = pkgs.fastfetch;
      settings =
        cfg.cnfg
        // {
          logo = {
            source = "nixos_small";
            padding = {
              top = 1;
            };
          };
          display = {
            color = "blue";
            separator = "->  ";
          };
          modules = [
            {
              type = "host";
              key = "PC ";
              keyColor = "white";
              outputColor = "red";
            }
            {
              type = "os";
              key = "OS ";
              keyColor = "blue";
              outputColor = "green";
            }
            {
              type = "kernel";
              key = "Kernel ";
              keyColor = "green";
              outputColor = "yellow";
            }
            "break"
            {
              type = "custom";
              format = "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓";
            }
            "break"
            {
              type = "disk";
              key = "Disk ";
              keyColor = "cyan";
              outputColor = "blue";
            }
            {
              type = "cpu";
              key = "Cpu ";
              keyColor = "blue";
              outputColor = "cyan";
            }
            {
              type = "gpu";
              key = "Gpu ";
              keyColor = "green";
              outputColor = "green";
            }
            {
              type = "memory";
              key = "Ram ";
              keyColor = "yellow";
              outputColor = "yellow";
            }
          ];
        };
    };
  };
}
