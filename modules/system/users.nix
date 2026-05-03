{ lib, pkgs, ... }:
{
  # Global Shell
  programs.zsh.enable = true;

  # Users
  users.mutableUsers = lib.mkForce false;
  users.users.aron = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "video" "audio" ];
    shell = pkgs.zsh;
    hashedPasswordFile = "/persist/passwords/aron";
  };
  users.users.root.hashedPasswordFile = "/persist/passwords/root";

  # Disable Lecture
  security.sudo.extraConfig = ''
    		Defaults lecture = never
    	'';
}
