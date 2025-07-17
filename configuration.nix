# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

#{
#  imports =
#    [ # Include the results of the hardware scan.
#      ./hardware-configuration.nix
#    ];

 let
   home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
 in
 {
   imports =
     [
       ./hardware-configuration.nix
       (import "${home-manager}/nixos")
     ];
   
  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    devices = [ "nodev" ];
    efiSupport = true;
    useOSProber = true;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Nvidia Configuration
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.latest;
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };
  hardware.nvidia.prime = {
    intelBusId = "pci@000:00:02.0";
    nvidiaBusId = "pci@000:04:00.0";
  };

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.luna = {
    isNormalUser = true;
    description = "Luna";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  home-manager.users.luna = { pkgs, ... }: {
    home.packages = [ pkgs.xwayland pkgs.nerd-fonts.jetbrains-mono pkgs.swaybg];
    programs.bash.enable = true;

    # Foot terminal
    programs.foot = {
      enable = true;
      settings = {
        main.font = "JetBrainsMono Nerd Font:size=9";

	#theme Dracula
	colors = {
	  foreground = "f8f8f2";
	  background = "282a36";
	  regular0 = "000000";
	  regular1 = "ff5555";
	  regular2 = "50fa7b";
	  regular3 = "f1fa8c";
	  regular4 = "bd93f9";
	  regular5 = "ff79c6";
	  regular6 = "8be9fd";
	  regular7 = "bfbfbf";
	  bright0 = "4d4d4d";
	  bright1 = "ff6e67";
	  bright2 = "5af78e";
	  bright3 = "f4f99d";
	  bright4 = "caa9fa";
	  bright5 = "ff92d0";
	  bright6 = "9aedfe";
	  bright7 = "e6e6e6";
	};
      };
    };

    home.stateVersion = "25.05";

    # Sway
    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      config = rec {
        modifier = "Mod4";
	terminal = "foot";
	startup = [
	  { command = "swaybg -i ${/home/luna/Pictures/Wallpaper/a.png} -m fill"; }
	];
	
        keybindings = {
          "${modifier}+0" = "workspace number 10";
          "${modifier}+1" = "workspace number 1";
          "${modifier}+2" = "workspace number 2";
          "${modifier}+3" = "workspace number 3";
          "${modifier}+4" = "workspace number 4";
          "${modifier}+5" = "workspace number 5";
          "${modifier}+6" = "workspace number 6";
          "${modifier}+7" = "workspace number 7";
          "${modifier}+8" = "workspace number 8";
          "${modifier}+9" = "workspace number 9";

          "${modifier}+Down"  = "focus down";
          "${modifier}+Left"  = "focus left";
          "${modifier}+Right" = "focus right";
          "${modifier}+Up"    = "focus up";

          "${modifier}+Return" = "exec ${terminal}";

          "${modifier}+Shift+0" = "move container to workspace number 10";
          "${modifier}+Shift+1" = "move container to workspace number 1";
          "${modifier}+Shift+2" = "move container to workspace number 2";
          "${modifier}+Shift+3" = "move container to workspace number 3";
          "${modifier}+Shift+4" = "move container to workspace number 4";
          "${modifier}+Shift+5" = "move container to workspace number 5";
          "${modifier}+Shift+6" = "move container to workspace number 6";
          "${modifier}+Shift+7" = "move container to workspace number 7";
          "${modifier}+Shift+8" = "move container to workspace number 8";
          "${modifier}+Shift+9" = "move container to workspace number 9";

          "${modifier}+Shift+Down"  = "move down";
          "${modifier}+Shift+Left"  = "move left";
          "${modifier}+Shift+Right" = "move right";
          "${modifier}+Shift+Up"    = "move up";

          "${modifier}+Shift+c" = "reload";
          "${modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit' ";
          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+l" = "move right";
          "${modifier}+Shift+minus" = "move scratchpad";
          "${modifier}+Shift+q" = "kill";
          "${modifier}+Shift+space" = "floating toggle";

          "${modifier}+a" = "focus parent";
          "${modifier}+b" = "splith";
          "${modifier}+d" = "exec /nix/store/gwk546kxw024v371l34sw11zvzqrxhdv-dmenu-5.3/bin/dmenu_path | /nix/store/gwk546kxw024v371l34sw11zvzqrxhdv-dmenu-5.3/bin/dmenu | /nix/store/7fjnb79r7p38piiyn5xwgcj5w7fpfi02-findutils-4.10.0/bin/xargs swaymsg exec --";
          "${modifier}+e" = "layout toggle split";
          "${modifier}+f" = "fullscreen toggle";
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";
          "${modifier}+minus" = "scratchpad show";
          "${modifier}+r" = "mode resize";
          "${modifier}+s" = "layout stacking";
          "${modifier}+space" = "focus mode_toggle";
          "${modifier}+v" = "splitv";
          "${modifier}+w" = "layout tabbed";

          # Custom tambahan kamu
          "${modifier}+bracketleft"  = "exec brightnessctl set 10%-";
          "${modifier}+bracketright" = "exec brightnessctl set 10%+";
        };
        input."2:14:ETPS/2_Elantech_Touchpad" = {
	  dwt = "enabled";
	  tap = "enabled";
	  middle_emulation = "enabled";
	  natural_scroll = "enabled";
	};
      };
    };

    # Swayidle
    services.swayidle = {
      enable = true;
      timeouts = [
        { timeout = 30; command = "${pkgs.swaylock}/bin/swaylock -fF"; }	
	{ timeout = 60; command = "${pkgs.systemd}/bin/systemctl suspend"; }
      ];
    };

    # Swaylock
    programs.swaylock = {
      enable = true;
      settings = {
        image = /home/luna/Pictures/Wallpaper/a.png;
      };
    };
  };

  security.polkit.enable = true;
  security.pam.services.swaylock = {};

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim htop fastfetch git gnome-boxes brave obsidian discord telegram-desktop localsend wl-clipboard brightnessctl
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Firewall Configuration
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 53317 ];
  };

  # Fail2ban Configuration
  services.fail2ban = {
    enable = true;
    ignoreIP = [ "127.0.0.1/8" ];
    bantime = "60m";
    maxretry = 5;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
