{
  description = "jacob flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
	nix-darwin = {
		url="github:nix-darwin/nix-darwin/master";
		inputs.nixpkgs.follows="nixpkgs";
	};
	home-manager={
		url="github:nix-community/home-manager";
		inputs.nixpkgs.follows="nixpkgs";
	};
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, ... }: let
    configuration = { pkgs, config, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
	
	nixpkgs.config.allowUnfree = true;

      environment.systemPackages =
        [ 
		pkgs.git
		pkgs.tmux
		pkgs.obsidian
		pkgs.neovim
        ];
	
      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;
      

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;
	
	system.keyboard.enableKeyMapping = true;

	system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

	system.defaults.CustomSystemPreferences."com.apple.AdLib" = {
	    	allowApplePersonalizedAdvertising = false;
	    	allowIdentifierForAdvertising = false;
	    	forceLimitAdTracking = true;
	    	personalizedAdsMigrated = false;
	};

	system.defaults.LaunchServices = {
    		LSQuarantine = false;
  	};
	system.defaults.controlcenter = {
		NowPlaying = false;
	};
	
	system.defaults.WindowManager = {
		GloballyEnabled = true;

	};

	system.defaults.finder = {
		AppleShowAllFiles = true;
		ShowStatusBar = true;
		ShowPathbar = true;
		FXPreferredViewStyle = "Nlsv";
		AppleShowAllExtensions = true;
		ShowMountedServersOnDesktop = true;
		_FXShowPosixPathInTitle = true;
		_FXSortFoldersFirst = true;
		_FXSortFoldersFirstOnDesktop = true;
		NewWindowTarget = "Home";

	};

	# https://github.com/nix-darwin/nix-darwin/blob/master/modules/system/defaults/NSGlobalDomain.nix
	system.defaults.NSGlobalDomain = {
		AppleShowAllFiles = true;
		AppleFontSmoothing = 2;
		AppleInterfaceStyleSwitchesAutomatically = true;
		AppleShowAllExtensions = true;
		AppleShowScrollBars = "Automatic";
		AppleScrollerPagingBehavior = true;
		"com.apple.mouse.tapBehavior" = 1;
		"com.apple.trackpad.scaling" = 1.5;
		"com.apple.trackpad.forceClick" = true;
		"com.apple.swipescrolldirection" = false;

	};
	
	# https://github.com/nix-darwin/nix-darwin/blob/master/modules/system/defaults/clock.nix
      	system.defaults.menuExtraClock = {
		ShowSeconds = true;
	};

	# https://github.com/nix-darwin/nix-darwin/blob/master/modules/system/defaults/dock.nix
	system.defaults.dock= {
		autohide = false;
		magnification = true;
		tilesize = 80;
		largesize = 96;
		mru-spaces = false;
		enable-spring-load-actions-on-all-items = true;
		show-recents = false;
		persistent-apps = [
      			{ app = "/System/Applications/System Settings.app"; }
      			{ app = "/Applications/Safari.app"; }
      			{ app = "/System/Applications/Mail.app"; }
      			{ app = "/System/Applications/Messages.app"; }
      			{ app = "/Applications/Ghostty.app"; }
      			{ app = "/System/Applications/iPhone Mirroring.app"; }
    		];
	};

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."trollbook" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
