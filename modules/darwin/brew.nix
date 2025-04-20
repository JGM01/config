{ pkgs, ... }: {
	homebrew = {
    		brewPrefix = "/opt/homebrew/bin";
    		enable = true;
    		caskArgs.no_quarantine = true;
    		global = {
      			brewfile = true;
    		};
    		casks = [ 
			"obsidian"
			"ghostty"
			"obs"
			"discord"
    		];
	};
}
