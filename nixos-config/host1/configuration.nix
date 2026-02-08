{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./../modules/core/default.nix
      ./../modules/de/plasma.nix
      ./../modules/driver/nvidia.nix
      ./../modules/nvf/nvf-configuration.nix
      ./../modules/services/fail2ban.nix
      ./../modules/services/firewall.nix
      ./../modules/services/pipewire.nix
      ./../modules/services/print.nix
      ./../modules/services/resolved.nix
      ./../modules/services/xserver.nix
      ./../modules/users/luna.nix
    ];

  networking.hostName = "rabbit";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
