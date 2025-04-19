{
description = "Nix Config";

inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
	nix-darwin = {
		url = "github:nix-darwin/nix-darwin/master";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs";
	};
};

outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }: {

	darwinConfigurations."trollbook" = nix-darwin.lib.darwinSystem {
		modules = [
			({config, ...}: {
				system.configurationRevision = self.rev or self.dirtyRev or null;
			})
			./modules/darwin/system.nix
			home-manager.darwinModules.home-manager 
			{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.users.jacob = {pkgs, ...}: {
					imports = [./modules/common/home.nix];
					home.username = "jacob";
					home.homeDirectory="/Users/jacob";
				};
			}
		];
	};
	
	nixosConfigurations."trollmachine" = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		modules = [
			./modules/linux/system.nix
			home-manager.nixosModules.home-manager
			{
				
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.users.jacob = {pkgs, ...}: {
					imports = [./modules/common/home.nix];
					home.username = "jacob";
					home.homeDirectory="/home/jacob";
				};
			}
		];
	};
};
}
