{ pkgs, ... }:

{
	nixpkgs.config.allowUnfree = true;

  	nix.settings.experimental-features = "nix-command flakes";
	
	security.pam.services.sudo_local.touchIdAuth = true;

  	system.keyboard.enableKeyMapping = true;

  	system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

  	system.defaults.CustomSystemPreferences."com.apple.AdLib" = {
    		allowApplePersonalizedAdvertising = false;
    		allowIdentifierForAdvertising = false;
    		forceLimitAdTracking = true;
    		personalizedAdsMigrated = false;
  	};

  	system.defaults.LaunchServices.LSQuarantine = false;

  	system.defaults.controlcenter.NowPlaying = false;

  	system.defaults.WindowManager.GloballyEnabled = true;

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

	system.defaults.NSGlobalDomain = {
		AppleShowAllFiles = true;
	    	AppleFontSmoothing = 2;
	    	AppleShowAllExtensions = true;
		AppleInterfaceStyle = "Dark";
	    	AppleShowScrollBars = "Automatic";
	    	AppleScrollerPagingBehavior = true;
	    	"com.apple.mouse.tapBehavior" = 1;
	    	"com.apple.trackpad.scaling" = 1.5;
	    	"com.apple.trackpad.forceClick" = true;
	    	"com.apple.swipescrolldirection" = false;
	};

	system.defaults.menuExtraClock.ShowSeconds = true;

	system.defaults.dock = {
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
	      		{ app = "/Applications/Discord.app"; }
	      		{ app = "/System/Applications/Messages.app"; }
	      		{ app = "/Applications/Ghostty.app"; }
	      		{ app = "/System/Applications/iPhone Mirroring.app"; }
	    	];
	};

	environment.shells = with pkgs; [ bash zsh nushell ];
	users.users.jacob = {
    		shell = pkgs.nushell;
  	};

	system.stateVersion = 6;

	nixpkgs.hostPlatform = "aarch64-darwin";
}
