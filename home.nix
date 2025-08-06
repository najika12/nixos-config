{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # Non GUI Programs 
    htop
    fastfetch
    xclip
    # GUI Programs
    thunderbird
    brave
    telegram-desktop
    localsend
    appflowy
    logseq
    keepassxc
    kitty
  ];
  programs.git = {
    enable = true;
    userName = "John Doe";
    userEmail = "johndoe@example.com";
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.nvf = {
    enable = true;
    settings.vim = {
      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
      };	
    statusline.lualine.enable = true;
    telescope.enable = true; 
    autocomplete.nvim-cmp.enable = true;
    lsp.enable = true;

      languages = {
        enableTreesitter = true;
        nix.enable = true;
        ts.enable = true;
      };
    };
  };  
  home.stateVersion = "25.05";
}
