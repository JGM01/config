{pkgs, isDarwin, ...}: {
	imports = [
		./git.nix
		./tmux.nix
	];

	home.packages = [
		pkgs.neovim
		pkgs.discord
		pkgs.btop
		pkgs.neofetch
		pkgs.obsidian
	];

	home.stateVersion = "24.05";
}
