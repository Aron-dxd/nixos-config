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

    # Global Packages
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    android-tools
  ];
}
