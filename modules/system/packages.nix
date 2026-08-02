{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Essentials
    git
    vim
    wget
    curl

    # Hardware / Kernel
    pciutils
    usbutils
    evtest
    mesa-demos

    #Audio
    pulseaudio
    bluez
    spotiflac
    inputs.noctavox.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Disk / Filesystem
    dosfstools
    ntfs3g
    gparted

    # Network
    inetutils

    # Service dependencies
    at

    # System Specific
    bibata-cursors

    # Files and Sharing
    localsend
    kdePackages.konversation
    
    # Misc
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    android-tools
    gvfs
    xdg-user-dirs
  ];
}
