{ pkgs, ... }: {
	homebrew = {
    		brewPrefix = "/opt/homebrew/bin";
    		enable = true;
    		caskArgs.no_quarantine = true;
    		global = {
      			brewfile = true;
    		};
    		casks = [ 
      			"raycast"
    		];
    		taps = [
      			"homebrew/core"
      			"homebrew/cask"
      			"homebrew/cask-fonts"
    		];
	};
}
