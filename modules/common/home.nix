{pkgs, ...}: {
	imports = [
		./git.nix
		./tmux.nix
	];

	home.packages = [
		pkgs.neovim
		pkgs.obsidian
	];

	home.homeDirectory = if builtins.elem builtins.currentSystem ["aarch64-darwin" "x86_64-darwin"] 
                         then "/Users/jacob"
                         else "/home/jacob";
	
	home.stateVersion = "24.05";
}
