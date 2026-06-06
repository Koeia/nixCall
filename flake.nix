{
    description = "Nix flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
            };
	noctalia = {
	    url = "github:noctalia-dev/noctalia-shell";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
	};

    outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
        nixosConfigurations.nixCall = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
	    specialArgs = { inherit inputs; };
            modules = [
	    	./noctalia.nix
                ./configuration.nix
                home-manager.nixosModules.home-manager {
                    home-manager = { 
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.jctannu4 = import ./home.nix;
                        backupFileExtension = "backup";
                        };
                    }
                ];
            };
        };
}
