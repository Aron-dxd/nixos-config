{ pkgs, ... }:
{	
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    polarity = "dark";

    fonts = {
      monospace = {
        name = "JetBrainsMono Nerd Font";
	package = pkgs.nerd-fonts.jetbrains-mono;
      };
      sansSerif = {
        name = "Noto Sans";
	package = pkgs.noto-fonts;
      };
      serif = {
        name = "Noto Serif";
	package = pkgs.noto-fonts;
      };
      emoji = {
        name = "Noto Color Emoji";
	package = pkgs.noto-fonts-color-emoji;
      };
    
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 12;
        popups = 12;
      };
    };

    cursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    icons = {
      enable = true;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
      package = pkgs.catppuccin-papirus-folders.override{ 
        flavor = "mocha"; 
	accent = "blue"; 
      };
    };
  };
}
