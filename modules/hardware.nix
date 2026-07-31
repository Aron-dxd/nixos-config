{ ... }:
{
  hardware = {
    # Graphics and Nvidia
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = true;
      open = false;
      nvidiaSettings = true;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };

    # Connectivity
    bluetooth.enable = true;
    opentabletdriver.enable = true;
  };

  services = {
    # Power and Thermals
    upower.enable = true;
    power-profiles-daemon.enable = true;
    throttled.enable = true;
    thermald.enable = true;

    # Audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    
    # Graphics
    xserver.videoDrivers = [ "nvidia" ];
  };

  # System Optimization
  zramSwap = {
    enable = true;
    memoryPercent = 150;
    algorithm = "zstd";
  };
}
