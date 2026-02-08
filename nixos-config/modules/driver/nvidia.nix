
{ config, pkgs, ... }:

{
  # Nvidia Configuration
  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];
  hardware = {
    graphics.enable = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.production;
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      prime = {
        sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:4:0:0";
      };
    };
  };
}
