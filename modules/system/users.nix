{ config, lib, pkgs, ... }:
{
  # Global Shell
  programs.zsh.enable = true;

  # Users
  users.mutableUsers = lib.mkForce false;
  users.users.aron = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "video" "audio" ];
    shell = pkgs.zsh;
    hashedPasswordFile = config.sops.secrets."aron-password".path;
  };
  users.users.root.hashedPasswordFile = config.sops.secrets."root-password".path;

  # Disable Lecture
  security.sudo.extraConfig = ''
    		Defaults lecture = never
    	'';
}
