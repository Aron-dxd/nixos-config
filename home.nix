{ config, pkgs, inputs, ... }:
{
	home.username = "aron";
	home.homeDirectory = "/home/aron";

	home.packages = with pkgs; [

	];

	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
	};

	programs.git = {
		enable = true;
		userName = "Aron-dxd";
		userEmail = "aronthomas019+github@gmail.com";
	};

	programs.home-manager.enable = true;

	home.stateVersion = "24.11";
}