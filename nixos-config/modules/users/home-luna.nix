{ config, pkgs, ... }:
{
  home.username = "luna";
  home.homeDirectory = "/home/luna";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    # firefox
  ];
  
  imports =
    [
      ./home-luna/git.nix
      ./home-luna/ssh.nix
      ./home-luna/sops.nix
    ];
 
  programs.home-manager.enable = true;
}
