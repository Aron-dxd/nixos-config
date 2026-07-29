{ config, lib, pkgs, ... }:
{
  # Global Shell
  programs.zsh.enable = true;
  programs.zsh.enableGlobalCompInit = false;

  # Users
  users= {
    mutableUsers = lib.mkForce false;
    users.aron = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "docker" "video" "audio" ];
      shell = pkgs.zsh;
      hashedPasswordFile = config.sops.secrets."aron-password".path;
    };
  
    users.root.hashedPasswordFile = config.sops.secrets."root-password".path;
  };

  # Disable Lecture
  security.sudo.extraConfig = ''
    		Defaults lecture = never
    	'';
  #Enable sudo and login with fingerprint
  security.pam.services = {
    sudo.fprintAuth = true;
    login.fprintAuth = true;
  };
}
