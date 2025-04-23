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

		pkgs.ripgrep # grep
		pkgs.bat # cat
		pkgs.fd # find
		pkgs.exa # ls
		pkgs.zoxide # cd
		pkgs.duf # du
		pkgs.procs # ps
		pkgs.sd # sed

		pkgs.tokei # code stats
		pkgs.hyperfine # measure exec time
		pkgs.fzf # fuzzy finder 
		pkgs.jq # json parsing
		pkgs.yq # yaml parsing
		pkgs.htop # not b(loat)top
		pkgs.hexyl # hex viewer
	];

	programs.nushell = {
		enable = true;
		configFile.text = 
		''
      		alias ls = eza
      		alias cd = z
		'';
	};

	home.stateVersion = "24.05";
}
