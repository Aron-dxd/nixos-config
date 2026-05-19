{ ... }:
{ 
  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
    syncthing = {
      enable = true;
      user = "aron";
      dataDir = "/home/aron";
    };

    atd.enable =  true;
  };

  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = false;
    };
    libvirtd = {
      enable = true;
      onBoot = "ignore";
    };
  };
}
