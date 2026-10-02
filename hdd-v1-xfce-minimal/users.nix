{ config, pkgs, ... }:
{
  users.users."kazuo" = {
    isNormalUser = true;
    description = "Kazuo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  users.users."guest" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "audio" "video" ];
    initialPassword = "1";
  };
}
