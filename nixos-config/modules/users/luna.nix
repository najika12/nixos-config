{ config, pkgs, ... }:

{
  users.users.luna = {
    isNormalUser = true;
    description = "Luna";
    extraGroups = [ "networkmanager" "wheel" ];
    hashedPassword = "$6$amB55.SO6ApwkPyz$tvjJqab.kBV2cZf0CVJHAoGunMJCL1D3CU6uI4dJrD2AAtGrieAfW3J/142ocOHo9slYETriNlT.rbdU2PTz2/";
    packages = with pkgs; [
    #  thunderbird
    ];
  };  
}
