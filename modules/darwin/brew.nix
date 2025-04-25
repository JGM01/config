{ pkgs, ... }: {
	homebrew = {
    		brewPrefix = "/opt/homebrew/bin";
    		enable = true;
    		caskArgs.no_quarantine = true;
    		global = {
      			brewfile = true;
    		};
    		casks = [ 
            "figma"
			"obsidian"
			"ghostty"
			"discord"
    		];
	};
}
