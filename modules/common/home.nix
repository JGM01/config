{pkgs, isDarwin, ...}: {
	imports = [
		./git.nix
		./tmux.nix
	];

	home.packages = [
		pkgs.neovim
		pkgs.obsidian
	];

	home.stateVersion = "24.05";
}
