{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.option.boot;
  inherit (lib) mkEnableOption mkOption types mkIf mkMerge;
in {
  options.option.boot = {
    enable = mkEnableOption "Enable The Default BootLoader And All of Its Settings, Including Kernel Settings";
    grub = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };
      ctp = {
        enable = mkOption {
          type = types.bool;
          default = true;
        };
        flavor = mkOption {
          type = types.str;
          default = "mocha";
        };
      };
    };
    sd-boot = {
      enable = mkEnableOption "Enable Systemd Boot";
      memtest.enable = mkEnableOption "Enable MemeTest For Systemd Boot";
    };
    kernPkgs = mkOption {
      type = types.raw;
      default = pkgs.linuxPackages_latest;
    };
    plymouth = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };
      ctp = {
        enable = mkOption {
          type = types.bool;
          default = true;
        };
        flavor = mkOption {
          type = types.str;
          default = "mocha";
        };
      };
    };
    kernParams = mkOption {
      type = types.listOf types.str;
      default = [];
    };
  };

  config = mkMerge [ (mkIf cfg.enable {
    boot = {
      loader = {
        grub = {
          enable = cfg.grub.enable;
          device = "/dev/sda";
          useOSProber = true;
          catppuccin = {
            enable = cfg.grub.ctp.enable;
            inherit (cfg.grub.ctp) flavor;
          };
        };
        systemd-boot = {
          enable = cfg.sd-boot.enable;
          memtest86.enable = cfg.sd-boot.memtest.enable;
        };
      };
      kernelPackages = cfg.kernPkgs;
      plymouth = {
        enable = cfg.plymouth.enable;
        catppuccin = {
          enable = cfg.plymouth.ctp.enable;
        };
      };
    };
  })
    (mkIf cfg.plymouth.enable { 
      boot.kernelParams = ["quiet" "splash"] ++ cfg.kernParams;
      

    })
  ];
}
