{
  pkgs,
  options,
  inputs,
  ...
}:
with options; {
  #  imports = [
  #   inputs.catppuccin.homeManagerModules.catppuccin
  # ];

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
    style = {
      catppuccin = {
        enable = true;
      };
    };
  };
}
