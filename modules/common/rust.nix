{ pkgs, fenix, ... }: {
	home.packages = with pkgs; [
		fenix.latest.toolchain
	];
}
