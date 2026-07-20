{
  description = "Configuration for Klave-Etude System";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-wsl.url = "github:nix-community/nixos-wsl";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager }: {
    nixosConfigurations = {
      nixos-wsl = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       modules = [
         nixos-wsl.nixosModules.default
         ./configuration-wsl.nix
         home-manager.nixosModules.home-manager
         {
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
           home-manager.users.kleha = import ./home-wsl.nix;
           home-manager.backupFileExtension = "bkup";
         }
       ];
     };
    };
  };
}
