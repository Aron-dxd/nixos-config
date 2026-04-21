{ config, pkgs, inputs, ... }:
{
	imports = [ inputs.impermanence.nixosModules.home-manager.impermanence ];

	home.username = "aron";
	home.homeDirectory = "/home/aron";

	home.packages = with pkgs; [

	];

	home.persistence."/persist/home/aron" = {
		directories = [
			"Downloads"
			"Documents"
			".ssh"
			".local/share/keyrings"
			".config/nvim"
		];
		files = [
			".zsh_history"
		];
		allowOther = true;
	};

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

	home.stateVersion = "25.11";
}