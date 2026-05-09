{ ... }:
{
  imports = [
    ./packages.nix
    ./services.nix
    ./xdg.nix
    ./stylix.nix
    ./apps
    ./desktop
  ];
  
  home.username = "aron";
  home.homeDirectory = "/home/aron";

  home.stateVersion = "25.11";
}
