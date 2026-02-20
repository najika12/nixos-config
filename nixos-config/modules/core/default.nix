{ inputs, ... }: {

  flake.nixosModules.defaultCore = { pkgs, ... }: {

    # Bootloader
    boot = {
      loader = {
        grub = {
          enable = true;
          useOSProber = true;
          enableCryptodisk = true;
        };
      };
    };

    # Kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # Networking
    networking.networkmanager.enable = true;

    # Time Zone
    time.timeZone = "Asia/Jakarta";

    # Keyboard Locale
    i18n.defaultLocale = "en_US.UTF-8";

    # Unfree Packages
    nixpkgs.config.allowUnfree = false;

    # System Packages
    environment.systemPackages = with pkgs; [
      brave
      signal-desktop-bin
      #obsidian
      cryptomator
      ppsspp
      localsend
      fastfetch
      protonvpn-gui
      qbittorrent
      tree
      wl-clipboard
      onlyoffice-desktopeditors
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      #unrar
      haruna
      vesktop
      btop
      kitty
    ];

    networking.hostName = "rabbit";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.11";
  };
}
