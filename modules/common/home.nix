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
	programs.nushell = {
    		enable = true;
    		envFile.text = ''
      		# Source Nix profile
      		if ("/etc/profiles/per-user/jacob/bin" | path exists) {
        		$env.PATH = ($env.PATH | split row (char path_sep) | prepend "/etc/profiles/per-user/jacob/bin" | uniq)
      		}
      		if ("/Users/jacob/.nix-profile/bin" | path exists) {
        		$env.PATH = ($env.PATH | split row (char path_sep) | prepend "/Users/jacob/.nix-profile/bin" | uniq)
      		}
    		'';
    		configFile.text = ''
      		# Your nushell config
      		$env.config = {
        		show_banner: false
      		}
    		'';
  	};
	home.stateVersion = "24.05";
}
