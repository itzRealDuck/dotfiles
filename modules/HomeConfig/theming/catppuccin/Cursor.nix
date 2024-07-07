{
  pkgs,
  options,
  inputs,
  ...
}:
with options; {
  catppuccin.pointerCursor = {
    enable = true;
    # accent = "green";
  };
}
