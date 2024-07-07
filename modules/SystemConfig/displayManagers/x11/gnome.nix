{options, ...}:
with options; {
  services.xserver = {
    desktopManager = {
      gnome = {
        enable = true;
      };
    };
  };
}
