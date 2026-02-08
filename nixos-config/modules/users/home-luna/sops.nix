{ conifg, pkgs, inputs, ... }:
{
  # Sops Configuration
  sops = {
    defaultSopsFile = ./../home-luna/secrets.yaml;
    age.keyFile = "/home/luna/.config/sops/age/keys.txt"; 
    secrets = {
      "github_ssh_key" = {
        path = "/home/luna/.ssh/id_ed25519";
        mode = "0600";
      };
    };
  };
}
