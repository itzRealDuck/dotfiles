{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
    iconTheme = {
      package = pkgs.candy-icons;
      name = "candy-icons";
    };
  };
}
