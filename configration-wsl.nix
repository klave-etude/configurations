{
  config,
  lib,
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  wsl.enable = true;
  wsl.defaultUser = "kleha";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = 23.11;
}
