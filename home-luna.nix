{ pkgs, lib, config,  ... }: {

  home.username = "luna";
  home.homeDirectory = "/home/luna";
  fonts.fontconfig.enable = true;
  home.packages = [ 
    pkgs.xwayland
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.hack
    pkgs.swaybg
    pkgs.sway-contrib.grimshot
  ];
  programs.bash.enable = true;
  home.stateVersion = "25.05";

  # Global Fonts
  fonts.fontconfig.defaultFonts = {
    serif = [ "JetBrains Mono" ];
    sansSerif = [ "JetBrains Mono" ];
    monospace = [ "JetBrains Mono" ];
  };

  # Foot terminal
  programs.foot = {
    enable = true;
    settings = {
      main.font = "Hack Nerd Font:size=9";

      # theme Dracula
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

  # Sway
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = rec {
      window.border = 1;
      window.titlebar = false;
      fonts = {
        names = [ "JetBrains Mono" ];
	size = 10.0;
      };
      modifier = "Mod4";
      terminal = "foot";
      menu = "rofi -show drun";
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
	"${modifier}+Menu" = "exec ${menu}";
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

	# Custom tambahan
	"${modifier}+bracketleft"  = "exec brightnessctl set 5%-";
	"${modifier}+bracketright" = "exec brightnessctl set 5%+";
	"${modifier}+semicolon" = "exec grimshot save output";
	"${modifier}+Control+semicolon" = "exec grimshot copy output";
	"${modifier}+apostrophe" = "exec grimshot save area";
	"${modifier}+Control+apostrophe" = "exec grimshot copy area";
	"${modifier}+z" = "exec swaylock";
      };
      input."2:14:ETPS/2_Elantech_Touchpad" = {
        dwt = "enabled";
	tap = "enabled";
	middle_emulation = "enabled";
	natural_scroll = "enabled";
      };
    };
  };

  # Swaylock
  programs.swaylock = {
    enable = true;
    settings = {
      image = /home/luna/Pictures/Wallpaper/a.png;
    };
  };

  # Rofi configuration
  programs.rofi = {
    enable = true;
  };
 }

