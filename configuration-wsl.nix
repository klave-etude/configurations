
{
  config,
  lib,
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  wsl.enable = true;
  wsl.defaultUser = "nixos";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    zsh
  ];
  programs.zsh.enable = true;
  system.stateVersion = "26.05";
}
