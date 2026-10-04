{ config, pkgs, ... }:

{
  #nix.settings.experimental-features = [ "nix-command" "flakes" ];

#  programs.nix-ld.enable = true;
#  programs.nix-ld.libraries = with pkgs; [
    # Pustaka dasar yang sering dicari aplikasi Electron / GTK
#    stdenv.cc.cc.lib
#    glib
#    gtk3
#    gobject-introspection
#    nss
#    nspr
#    atk
#    at-spi2-atk
#    cups
#    dbus
#    libdrm
#    expat
#    libxkbcommon
#    mesa
#    wayland
#    pipewire
#    libx11
#    libxcomposite
#    libxcursor
#    libxdamage
#    libxext
#    libxfixes
#    libxi
#    libxrandr
#    libxrender
#    libxscrnsaver
#    libxtst
#    alsa-lib
#  ];

  # Font tambahan & dukungan Microsoft Core Fonts
  fonts.packages = with pkgs; [
    corefonts
    noto-fonts
    noto-fonts-color-emoji
    fira-code
    fira-code-symbols
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  environment.systemPackages = with pkgs; [
    freeoffice
    brave
    #kdePackages.plasma-systemmonitor
    telegram-desktop
    session-desktop
    vscode
    nodejs
    #luanti
    btop
    #lollypop
    audacious
    kdePackages.gwenview
    #flameshot
    git
    #virtualbox
    macchanger
    gsmartcontrol #harddisk monitoring tool
    smartmontools #monitoring tool binary
    localsend #local transfer file
#    veracrypt #disk encryption
    inxi #cli status monitor
    pciutils    # Menyediakan perintah 'lspci'
    mesa-demos  # Menyediakan perintah 'glxinfo'
    libva-utils # Memberikan perintah 'vainfo' untuk cek VA-API
    legcord #discord alternative
    parabolic #video downloader
#    protonup-qt #proton helper
    bottles #windows in linux
    # === network scanner === #
    netdiscover
    nmap
    evillimiter
    bettercap
    #sudo bettercap -eval "caplets.update; ui.update; q"
    #sudo bettercap -caplet http-ui
    # === #
    gparted-full #disk partition
    # === hotspot service ===
    linux-wifi-hotspot
    hostapd
    dnsmasq
    iptables
    iw
    # === #
    #keepassxc #local save password
    #opensnitch-ui #advance firewall
    # === archive service === #
    file-roller
    p7zip
    unzip
    unrar
    gnutar
    # === #
    papirus-icon-theme # icon
    # === multimedia codec plugin === #
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    # === #
    # === chess === #
    gnome-chess
    chessx
    cutechess
    stockfish
    gnuchess
    # === #
  ];
}
