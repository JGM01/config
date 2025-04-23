{pkgs, ...}: {
	imports = [
		./git.nix
		./tmux.nix
	];

	home.packages = [
		pkgs.neovim
		pkgs.btop
		pkgs.neofetch
		pkgs.rustup
		pkgs.uv
		pkgs.bun
		pkgs.nushell
	];

	home.stateVersion = "24.05";
}
