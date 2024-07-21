{pkgs, ...}: {
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "/dev/sda";
        useOSProber = true;
        catppuccin = {
          enable = true;
        };
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
    plymouth = {
      enable = true;
      catppuccin = {
        enable = true;
      };
    };
    kernelParams = ["quiet" "splash"];
  };
}
