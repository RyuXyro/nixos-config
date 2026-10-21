{ config, pkgs, ... }:

{
  users.users."kazuo" = {
    isNormalUser = true;
    description = "Kazuo";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
    packages = with pkgs; [
    ];
  };

  users.users."adit" = {
    isNormalUser = true;
    initialPassword = "ngapainbang";
    description = "Adit";
    extraGroups = [ "networkmanager" "audio" "video" ];
    packages = with pkgs; [
    ];
  };

  users.users."guest" = {
    isNormalUser = true;
    initialPassword = "1";
    description = "Guest";
    extraGroups = [ "networkmanager" "audio" "video" ];
    packages = with pkgs; [
    ];
  };
}
