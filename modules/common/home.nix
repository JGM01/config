{pkgs, ...}: {
	imports = [
		./git.nix
		./tmux.nix
	];

	home.packages = [
		pkgs.neovim
		pkgs.obsidian
	];
	home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/jacob" else "/home/jacob";
	home.stateVersion = "24.05";
}
