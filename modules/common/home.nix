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

		pkgs.ripgrep # grep
		pkgs.bat # cat
		pkgs.fd # find
		pkgs.eza # ls
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

		pkgs.starship # everyone else is doing it idk
	];

	programs.zsh = {
    		enable = true;
    		enableCompletion = true;  
    		autosuggestion.enable = true;  
    		syntaxHighlighting.enable = true;  

    		shellAliases = {
			cd = "z";
			ls = "eza";
			grep = "ripgrep";
    		};

    		initExtra = 
		''
      		eval "$(zoxide init zsh)"

		eval "$(starship init zsh)"
    		'';
  	};


	home.stateVersion = "24.05";
}
