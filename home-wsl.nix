{ pkgs, ... }: {
  imports = [
    ./direnv.nix
  ];
  home.packages = with pkgs; [
    git
    zsh
    gh
    wget
  ];
  home.stateVersion = "26.05";
}
