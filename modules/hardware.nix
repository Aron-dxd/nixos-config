{ ... }:
{
  # Graphics and Nvidia
  hardware.graphics.enable = true;
  hardware.nvidia = {
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
  services.xserver.videoDrivers = [ "nvidia" ];

  # Connectivity
  hardware.bluetooth.enable = true;

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Power and Thermals
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  services.throttled.enable = true;
  services.thermald.enable = true;

  # System Optimization
  zramSwap.enable = true;
  zramSwap.algorithm = "zstd";
}
