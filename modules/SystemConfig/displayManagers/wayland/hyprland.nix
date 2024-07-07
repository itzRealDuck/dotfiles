{
  options,
  inputs,
  pkgs,
  ...
}:
with options; {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
