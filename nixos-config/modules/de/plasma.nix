{ inputs, ... }: {

  flake.nixosModules.plasma = { pkgs, ... }: {

    # Desktop Environment
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}

