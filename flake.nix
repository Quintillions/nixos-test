{
  description = "niri"
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ...}: {
  nixosConfigurations.nixxer = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager{
            home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.quin = import ./home.nix;
            };
        };
      ];
    };
  };
}