{ pkgs, fenix, ... }: {
	home.packages = with pkgs; [
		fenix.complete.toolchain
	];
}
