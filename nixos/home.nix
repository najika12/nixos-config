{ config, pkgs, lib, ... }:

{ 
  home.enableNixpkgsReleaseCheck = false;
  home.packages = with pkgs; [
    htop
    fastfetch
    thunderbird
    brave
    telegram-desktop
    localsend
    appflowy
    logseq
    keepassxc
    xorg.xrandr
    xorg.xev    
    flameshot
    feh
    jetbrains-mono
    brightnessctl
    vlc    
  ];
  programs.git = {
    enable = true;
    userName = "John Doe";
    userEmail = "johndoe@example.com";
  };
  programs.nvf = {
    enable = true;
    settings.vim = {
      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
      };	
      statusline.lualine.enable = true;
      telescope.enable = true; 
      autocomplete.nvim-cmp.enable = true;  
      lsp.enable = true;
      
      extraPlugins = with pkgs.vimPlugins; {
        neo-tree = {
          package = neo-tree-nvim;      
          setup = "require('neo-tree').setup({})";
        };
      };  
      languages = {
        enableTreesitter = true;
        nix.enable = true;
      };  
    };    
  };
  programs.kitty = {
    enable = true;
    font = {
      name = "Hack";
      package = pkgs.hack-font;  
      size = 11;  
    };    
    themeFile = "Catppuccin-Mocha";    
    extraConfig = ''
       shell_integration enabled 
    '';    
  };

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod1";
      terminal = "kitty";
      window.titlebar = false;
      floating.titlebar = false;
      keybindings = import ./i3-keybindings.nix { inherit config lib pkgs; };
      fonts = {
        names = [ "JetBrains Mono" ];
        style = "Regular";        
        size = "11.0";
      };
      startup = [
        { command = "xrandr --dpi 100"; always = true; }
        { command = "feh --bg-scale ~/Pictures/Wallpaper/wp11912466-catppuccin-wallpapers.png"; always = true; }
      ];
    };
  };      
  home.stateVersion = "25.05";
}
