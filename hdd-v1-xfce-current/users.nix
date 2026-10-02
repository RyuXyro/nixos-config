{ config, pkgs, ... }:
{
  users.users."kazuo" = {
    isNormalUser = true;
    description = "Kazuo";
    extraGroups = [ "networkmanager" "wheel" "gamemode" ];
    packages = with pkgs; [
     steam
     #heroic
     efibootmgr
     #lutris
    ];
  };

  users.users."guest" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "audio" "video" ];
    initialPassword = "1";
  };
}
