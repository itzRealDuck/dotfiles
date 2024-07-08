{pkgs, ...}: {
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
