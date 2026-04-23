{ config, pkgs, inputs, ... }:
{
	imports = [ ./noctalia.nix ];	
	
	home.username = "aron";
	home.homeDirectory = "/home/aron";

	home.packages = with pkgs; [
		kitty
	];
	
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			monitor = [ ",preferred,auto,1" ];
			exec-once = [ "kitty" ];
	
			input = {
				kb_layout = "us";
				touchpad.natural_scroll = true;
			};

			"$mod" = "SUPER";
		
			bind = [
				"$mod, Return, exec, kitty"
				"$mod, Q, killactive"
				"$mod, M,  exit"
			];	
		};
	};
	
	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		profileExtra = ''
			if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
				exec start-hyprland
			fi
		'';
	};

	programs.git = {
		enable = true;
		settings.user.name = "Aron-dxd";
		settings.user.email = "aronthomas019+github@gmail.com";
	};

	programs.home-manager.enable = true;

	home.stateVersion = "25.11";
}
