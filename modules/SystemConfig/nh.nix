{pkgs, ...}: {
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "-d";
    };
    flake = "/etc/nixos";
  };
}
