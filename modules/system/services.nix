{ ... }:
{
  services.syncthing = {
    enable = true;
    user = "aron";
    dataDir = "/home/aron";
  };

  services.atd.enable =  true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
  };
}
