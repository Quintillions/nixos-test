{
  description = "niri";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";  # Use same quickshell version
    };
  };


  outputs = inputs@{ self, nixpkgs, home-manager, ...}: {
  nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";	 	
      modules = [
        { _module.args.inputs = inputs; }
        ./configuration.nix
        ./noctalia.nix
        home-manager.nixosModules.home-manager{
            home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.quin = import ./home.nix;
            };
        }
      ];
    };
  };
}







