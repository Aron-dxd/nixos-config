{ pkgs, ... }:

let
  rosewater = "#f5e0dc";
  flamingo  = "#f2cdcd";
  pink      = "#f5c2e7";
  mauve     = "#cba6f7";
  red       = "#f38ba8";
  maroon    = "#eba0ac";
  peach     = "#fab387";
  yellow    = "#f9e2af";
  green     = "#a6e3a1";
  teal      = "#94e2d5";
  sky       = "#89dceb";
  sapphire  = "#74c7ec";
  blue      = "#89b4fa";
  lavender  = "#b4befe";
  text      = "#cdd6f4";
  overlay0  = "#6c7086";
in

{
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;
    settings = {
      "$schema" = "https:#github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      logo = {
        source = ./nixos.png;
        height = 15;
        width = 30;
        padding = {
          top = 10;
          left = 3;
        };
      };

      modules = [
        "break"
        {
          type = "command";
          text = "echo \${USER}@\${HOSTNAME}";
          key = "      ";
	  keyColor = mauve;
        }
        {
          type = "custom";
          format = "┌──────────────────────Hardware──────────────────────┐";
        }
        {
          type = "host";
          key = "   PC";
          keyColor = blue;
        }
        {
          type = "cpu";
          key = "   CPU";
          showPeCoreCount = true;
          keyColor = sapphire;
        }
        {
          type = "gpu";
          key = "  󰊴 GPU";
          keyColor = sky;
        }
        {
          type = "memory";
          key = "  󰑭 Memory";
          keyColor = teal;
        }
        {
          type = "disk";
          key = "   Disk";
          keyColor = green;
        }
        {
          type = "display";
          key = "  󰍹 Display";
          keyColor = yellow;
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌──────────────────────Software──────────────────────┐";
        }
        {
          type = "os";
          key = "   OS";
          keyColor = mauve;
        }
        {
          type = "kernel";
          key = "   Kernel";
          keyColor = lavender;
        }
        {
          type = "packages";
          key = "  󰏖 Packages";
          keyColor = pink;
        }
        {
          type = "de";
          key = " DE";
          keyColor = flamingo;
        }
        {
          type = "wm";
          key = "   WM";
          keyColor = rosewater;
        }
        {
          type = "terminal";
          key = "   Terminal";
          keyColor = peach;
        }
        {
          type = "shell";
          key = "   Shell";
	  keyColor = maroon;
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌────────────────────Uptime/Age──────────────────────┐";
        }
        {
          type = "command";
          key = "  OS Age";
          keyColor = overlay0;
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "uptime";
          key = "  Uptime";
          keyColor = text;
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        {
          type = "colors";
          paddingLeft = 2;
          symbol = "circle";
        }
        "break"
      ];
    };
  };
}
