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

    #Audio
    pulseaudio
    bluez

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

    # Misc
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.noctavox.packages.${pkgs.stdenv.hostPlatform.system}.default
    android-tools
    gvfs
    xdg-user-dirs
    spotiflac
  ];
}
