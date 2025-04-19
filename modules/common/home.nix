{pkgs, isDarwin, ...}: {
	imports = [
		./git.nix
		./tmux.nix
	];

	home.packages = [
		pkgs.neovim
		pkgs.obsidian
	];

	home.homeDirectory = if isDarwin then "/Users/jacob" else "/home/jacob";

	home.stateVersion = "24.05";
}
