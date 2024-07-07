{
  options,
  pkgs,
  ...
}:
with options; {
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.grub.catppuccin.enable = true;
}
