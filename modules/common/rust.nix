{ pkgs, fenix, ... }: {
	home.packages = with pkgs; [
		fenix.stable.toolchain
	];
}
