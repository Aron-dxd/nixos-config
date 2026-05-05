{ pkgs, ... }:

{
  programs.atool = {
    enable = true;
    extraPackages = with pkgs; [
      p7zip      
      unzip     
      zip         
      unrar
      gnutar
      gzip
      bzip2
      xz
      lzip
      lzop
    ];
  };
}
