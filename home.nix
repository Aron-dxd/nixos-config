{ config, pkgs, inputs, ... }:
{
	imports = [
		./noctalia.nix
		./hyprland.nix
		./xdg.nix
	];

	home.username = "aron";
	home.homeDirectory = "/home/aron";

	home.packages = with pkgs; [
		kitty
		neovim
		wl-clipboard
		wtype
		satty
		gpu-screen-recorder
		brightnessctl
		playerctl
		rose-pine-cursor
		mpv
		thunar
		yazi
		imv
		jq
		fastfetch
		fzf
		yt-dlp
		ffmpeg
	];

	home.sessionVariables = {
		EDITOR = "nvim";
		VISUAL = "nvim";
	};

	programs.zsh = {
		enable = true;
		dotDir = "${config.xdg.configHome}/zsh";
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
		    rebuild = "cd /etc/nixos && sudo nixos-rebuild switch --flake .#hiroshima";
		};
	};

	programs.git = {
		enable = true;
		settings.user.name = "Aron-dxd";
		settings.user.email = "aronthomas019+github@gmail.com";
	};

	programs.home-manager.enable = true;

	home.stateVersion = "25.11";
}
