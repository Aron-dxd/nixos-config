{ ... }:
{
  # Hostname
  networking.hostName = "hiroshima";

  # Hardware Specific Bus ID's
  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  # GPU Specific Variables
  environment.sessionVariables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
  };

  system.stateVersion = "25.11";
}
