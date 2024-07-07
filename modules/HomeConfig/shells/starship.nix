{
  options,
  pkgs,
  lib,
  ...
}:
with options; {
  programs.starship = {
    enable = true;
    package = pkgs.starship;
    enableZshIntegration = true;
    catppuccin = {
      enable = true;
      flavor = "macchiato";
    };
    settings = lib.importTOML ../../../non_nix_files/starship.toml;
  };
}
