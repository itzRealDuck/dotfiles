{pkgs, ...}: {
  nixpkgs.config = {
    allowBroken = true;
    allowUnfreePredicate = _: true;
    allowUnfree = true;
  };
}
