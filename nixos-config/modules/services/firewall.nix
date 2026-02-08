{ config, pkgs, ... }:
{
  # Firewall Configuration
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 53317 ];
  };  
}
