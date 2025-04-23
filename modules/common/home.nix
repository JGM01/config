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
      # Nix-darwin environment setup
      $env.__NIX_DARWIN_SET_ENVIRONMENT_DONE = 1

      # Set PATH
      $env.PATH = [
        $"($env.HOME)/.nix-profile/bin"
        $"/etc/profiles/per-user/($env.USER)/bin"
        "/run/current-system/sw/bin"
        "/nix/var/nix/profiles/default/bin"
        "/usr/local/bin"
        "/usr/bin"
        "/usr/sbin"
        "/bin"
        "/sbin"
      ]

      # Editor
      $env.EDITOR = "vim"  # Note: Changed "VIM" to "vim" for consistency; adjust if needed

      # Nix path
      $env.NIX_PATH = [
        $"darwin-config=($env.HOME)/.nixpkgs/darwin-configuration.nix"
        "/nix/var/nix/profiles/per-user/root/channels"
      ]

      # SSL certs
      $env.NIX_SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt"

      # Pager
      $env.PAGER = "less -R"

      # Terminfo directories
      $env.TERMINFO_DIRS = [
        $"($env.HOME)/.nix-profile/share/terminfo"
        $"/etc/profiles/per-user/($env.USER)/share/terminfo"
        "/run/current-system/sw/share/terminfo"
        "/nix/var/nix/profiles/default/share/terminfo"
        "/usr/share/terminfo"
      ]

      # XDG config directories
      $env.XDG_CONFIG_DIRS = [
        $"($env.HOME)/.nix-profile/etc/xdg"
        $"/etc/profiles/per-user/($env.USER)/etc/xdg"
        "/run/current-system/sw/etc/xdg"
        "/nix/var/nix/profiles/default/etc/xdg"
      ]

      # XDG data directories
      $env.XDG_DATA_DIRS = [
        $"($env.HOME)/.nix-profile/share"
        $"/etc/profiles/per-user/($env.USER)/share"
        "/run/current-system/sw/share"
        "/nix/var/nix/profiles/default/share"
      ]

      # Preserve TERM
      $env.TERM = $env.TERM

      # Nix user profile directory
      $env.NIX_USER_PROFILE_DIR = $"/nix/var/nix/profiles/per-user/($env.USER)"

      # Nix profiles
      $env.NIX_PROFILES = [
        "/nix/var/nix/profiles/default"
        "/run/current-system/sw"
        $"/etc/profiles/per-user/($env.USER)"
        $"($env.HOME)/.nix-profile"
      ]

      # Append ~/.nix-defexpr/channels to NIX_PATH if it exists
      if ($"($env.HOME)/.nix-defexpr/channels" | path exists) {
        $env.NIX_PATH = ($env.NIX_PATH | append $"($env.HOME)/.nix-defexpr/channels")
      }

      # Set NIX_REMOTE to daemon if /nix/var/nix/db is not writable
      if (false in (ls -l /nix/var/nix | where type == dir | where name == "db" | get mode | str contains "w")) {
        $env.NIX_REMOTE = "daemon"
      }
    '';
    configFile.text = ''
      # Optional: Customize nushell config
      $env.config = {
        show_banner: false
      }
    '';
  };

  # Manage ghostty configuration
  home.file.".config/ghostty/config".text = ''
    command = /etc/profiles/per-user/jacob/bin/nu --interactive
  '';

	home.stateVersion = "24.05";
}
