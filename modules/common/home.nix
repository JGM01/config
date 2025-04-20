{pkgs, isDarwin, ...}: {
	imports = [
		./git.nix
		./tmux.nix
	];

	home.packages = [
		pkgs.neovim
		pkgs.discord
		pkgs.dolphin-emu
		pkgs.btop
		pkgs.obsidian
	];

	home.stateVersion = "24.05";
}
