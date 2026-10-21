{ config, pkgs, ... }:

{

  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  # Mengaktifkan daemon auto-cpufreq
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "schedutil"; # schedutil lebih halus dalam menaikkan clock CPU
      turbo = "auto";
    };
  };

  # Mencegah CPU Intel mengalami throttling mendadak
  services.thermald.enable = true;

  # Font tambahan & dukungan Microsoft Core Fonts
  fonts.packages = with pkgs; [
    corefonts
    noto-fonts
    noto-fonts-color-emoji
    fira-code
    fira-code-symbols
  ];

  environment.systemPackages = with pkgs; [
    freeoffice #office
    vscode #code editor
    nodejs #js compiler
    brave #browser
    simplex-chat-desktop #privacy #1
    telegram-desktop #telegram
    btop #task manager
    celluloid #media player
    audacious #audio player
    macchanger #change mac address
    gsmartcontrol #harddisk monitoring tool
    smartmontools #monitoring tool binary
    localsend #local transfer file
    parabolic #video downloader
    gparted-full #disk partition
    galculator #calculator
    nmap #network scanner
    netdiscover #network discover
    git
    tcpdump
    # === hotspot service ===
    linux-wifi-hotspot
    hostapd
    dnsmasq
    iptables
    iw
    # === #
    # === archive service === #
    thunar-archive-plugin
    file-roller
    p7zip
    unzip
    unrar
    gnutar
    rar
    zip
    lzop
    xz
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
