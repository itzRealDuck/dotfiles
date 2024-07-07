{
  pkgs,
  options,
  ...
}: {
  services.desktopManager = {
    plasma6 = {
      enable = true;
    };
  };
}
