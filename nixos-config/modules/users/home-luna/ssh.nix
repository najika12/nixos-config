{ config, pkgs, inputs, ... }:
{
  # Konfigurasi SSH Client
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
      };
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = config.sops.secrets.github_ssh_key.path; 
      };
    };
  };
  
  # SSH User Wide
  services.ssh-agent = {
    enable = true;
  };
}
