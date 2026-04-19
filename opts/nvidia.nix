{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;

    # CHANGE THIS: The GTX 970 is Maxwell, which is NOT supported by the open modules.
    open = false; 

    nvidiaSettings = true;

    # Stable is fine for the 970 (Maxwell), but ensure it's the proprietary version
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true; 
  };
}
