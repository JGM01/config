{pkgs, ...}: {
	imports = [
		./git.nix
		./tmux.nix
	];

	home.packages = [
		pkgs.neovim
		pkgs.obsidian
	];
	home.homeDirectory = let
      		isLinux = pkgs.stdenv.hostPlatform.isLinux;
      		isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
    		in 
			if isDarwin then "/Users/jacob"
      			else if isLinux then "/home/jacob"
      			else throw "Unsupported platform: neither Linux nor Darwin";
	
	home.stateVersion = "24.05";
}
