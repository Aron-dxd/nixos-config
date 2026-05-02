{ config, pkgs, inputs, ... }:
{
	imports = [
		./noctalia.nix
		./hyprland.nix
		./xdg.nix
	];

	catppuccin.flavor = "mocha";
	catppuccin.enable = true;

	gtk = {
		enable = true;
		gtk4.theme = null;
		theme = {
	      		name = "catppuccin-mocha-mauve-standard"; # Example name
	     		package = pkgs.catppuccin-gtk.override {
				accents = [ "mauve" ];
				size = "standard";
				variant = "mocha";
			};
		};
		
		gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
		gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
	};

	home.username = "aron";
	home.homeDirectory = "/home/aron";

	home.packages = with pkgs; [
		wl-clipboard
		wtype
		satty
		gpu-screen-recorder
		brightnessctl
		playerctl
		thunar
		jq
		fastfetch
		yt-dlp
		ffmpeg
		keepassxc
	];

	programs = {
		kitty.enable = true;
		bat.enable = true;
		fzf.enable = true;
		yazi ={
			enable = true;
			shellWrapperName = "y";
		};
		mpv.enable = true;
		imv.enable = true;
		neovim = {
			enable = true;
			defaultEditor = true;
			viAlias = true;
			vimAlias = true;
			withRuby = false;
			withPython3 = false;
		};
		zsh = {
			enable = true;
			dotDir = "${config.xdg.configHome}/zsh";
			autosuggestion.enable = true;
			syntaxHighlighting.enable = true;
			shellAliases = {
				rebuild = "cd /etc/nixos && sudo nixos-rebuild switch --flake .#hiroshima";
			};
		};
		git = {
			enable = true;
			settings.user.name = "Aron-dxd";
			settings.user.email = "aronthomas019+github@gmail.com";
		};
		home-manager.enable = true;
	};

	home.sessionVariables = {
		EDITOR = "nvim";
		VISUAL = "nvim";
		GTK_THEME = "catppuccin-mocha-mauve-standard";
	};

	home.stateVersion = "25.11";
}
