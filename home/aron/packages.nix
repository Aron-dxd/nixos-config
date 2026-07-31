{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Terminal and CLI
    bc
    tree
    tmux
    brightnessctl
    wl-clipboard
    wtype
    xclip
    inotify-tools
  	
    # System and Monitoring
    btop

    # File Management
    thunar
    tumbler
    trash-cli
    dust

    # Media and Downloads
    ffmpeg
    ffmpegthumbnailer
    wf-recorder
    eyedropper
    crosspipe
    qbittorrent

    # Development
    rclone
    code-cursor

    # Productivity and Information
    anki
    tumbler
    qalculate-gtk

    # Misc
    opentabletdriver
  ];

  programs = {
    # Shell and Terminal

    # CLI tools
    bat.enable = true;
    lsd.enable = true;
    
    # Media
    mpv.enable = true;
    imv.enable = true;
    yt-dlp.enable = true;
    satty.enable = true;
    cava.enable = true;

    # Development
    jq.enable = true;
    vscode.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };

    # Secrets
    keepassxc.enable = true;

    # Apps
    vesktop.enable = true;
    calibre.enable = true;

    home-manager.enable = true;
  };
}
