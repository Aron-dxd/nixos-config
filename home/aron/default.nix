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
  
  home = {
    username = "aron";
    homeDirectory = "/home/aron";

    stateVersion = "25.11";
  };
}
