{pkgs, ...}: {
  services.displayManager = {
    sddm = {
      enable = true;
      catppuccin = {
        enable = true;
        background = "/home/itzreakduck/Pictures/adventuretime.jpg";
      };
    };
  };
}
