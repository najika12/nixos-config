{ inputs, ... }: {
  
  flake.nixosModules.disko = { pkgs, ... }: {
    imports = [ inputs.disko.nixosModules.disko ];
  
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda"; # UBAH INI: Sesuaikan dengan disk target Anda (lsblk)
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02";
              priority = 1;
            };
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                # Best Practice: Matikan jika menggunakan HDD lama,
                # nyalakan untuk SSD demi performa (dengan sedikit risiko privasi metadata)
                extraOpenArgs = [ "--allow-discards" ]; 
                settings = {
                  # Menggunakan keyFile untuk otomatisasi (opsional) atau password prompt (default)
                  allowDiscards = true;
                };
                content = {
                  type = "lvm_pv";
                  vg = "pool";
                };
              };
            };
          };
        };
      };
    };
    lvm_vg = {
      pool = {
        type = "lvm_vg";
        lvs = {
          swap = {
            size = "8G"; # Sesuaikan ukuran Swap
            content = {
              type = "swap";
              resumeDevice = true; # Penting untuk Hibernation
            };
          };
          root = {
            size = "100%FREE";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              mountOptions = [ "defaults" ];
            };
          };
        };
      };
    };
  };
};
}
