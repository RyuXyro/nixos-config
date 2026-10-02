{ config, pkgs, ... }:

{
  # Font tambahan & dukungan Microsoft Core Fonts
  fonts.packages = with pkgs; [
    corefonts
    noto-fonts
    noto-fonts-color-emoji
    fira-code
    fira-code-symbols
  ];

  environment.systemPackages = with pkgs; [
    freeoffice
    #brave
    #telegram-desktop
    #btop
    audacious
    kdePackages.gwenview
    macchanger
    gsmartcontrol #harddisk monitoring tool
    smartmontools #monitoring tool binary
    #localsend #local transfer file
    #legcord #discord alternative
    #parabolic #video downloader
    bottles #windows in linux
    gparted-full #disk partition
    # === hotspot service ===
    #linux-wifi-hotspot
    #hostapd
    #dnsmasq
    #iptables
    #iw
    # === #
    # === archive service === #
    file-roller
    p7zip
    unzip
    unrar
    gnutar
    # === #
    # === multimedia codec plugin === #
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    # === #
  ];
}
