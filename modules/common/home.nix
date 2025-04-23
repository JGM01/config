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
      		# Source Nix profile (system-wide)
      		if ("/nix/var/nix/profiles/default/bin" | path exists) {
        		$env.PATH = ($env.PATH | split row (char path_sep) | prepend "/nix/var/nix/profiles/default/bin" | uniq)
      		}

      		# Source home-manager profile
      		if ("/etc/profiles/per-user/jacob/bin" | path exists) {
       			$env.PATH = ($env.PATH | split row (char path_sep) | prepend "/etc/profiles/per-user/jacob/bin" | uniq)
      		}

      		# Source user Nix profile
      		if ("/Users/jacob/.nix-profile/bin" | path exists) {
        		$env.PATH = ($env.PATH | split row (char path_sep) | prepend "/Users/jacob/.nix-profile/bin" | uniq)
      		}

      		# Source macOS system paths (for zsh, etc.)
      		if ("/bin" | path exists) {
        		$env.PATH = ($env.PATH | split row (char path_sep) | prepend "/bin" | uniq)
      		}
      		if ("/usr/bin" | path exists) {
        		$env.PATH = ($env.PATH | split row (char path_sep) | prepend "/usr/bin" | uniq)
      		}
    		'';
    		configFile.text = ''
      		$env.config = {
       			show_banner: false
      		}
    		'';
  };
	home.stateVersion = "24.05";
}
