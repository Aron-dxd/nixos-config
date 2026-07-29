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
    udev.enable = true;

    udev.extraRules = ''
      SUBSYSTEM=="usb", ATTR{idVendor}=="320f", ATTR{idProduct}=="5055", MODE="0666"
      KERNEL=="hidraw*", ATTRS{idVendor}=="320f", ATTRS{idProduct}=="5055", MODE="0666"
    '';

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
