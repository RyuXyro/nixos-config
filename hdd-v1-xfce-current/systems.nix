{ config, pkgs, ... }:

{
  # Mengizinkan OS menggunakan firmware penting untuk menstabilkan performa hardware
  hardware.enableRedistributableFirmware = true;

  security.polkit.enable = true;

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "kazuo" "guest" ];

  # Optimasi penyimpanan dengan deduplikasi hardlink
  nix.settings.auto-optimise-store = true;

  # Membatasi ukuran log agar tidak membebani I/O disk
  services.journald.extraConfig = ''
    SystemMaxUse=50M
    SystemMaxFileSize=10M
  '';

  # Contoh untuk mengaktifkan OpenGL / Vulkan umum
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-vaapi-driver # Driver VA-API khusus Intel generasi lama (Gen 3 / i965)
      libvdpau-va-gl
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-vaapi-driver
      libvdpau-va-gl
    ];
  };

  # Mengarahkan aplikasi agar memakai backend i965 yang kompatibel
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "i965";
  };

  zramSwap = {
    enable = true;
    # Menggunakan zstd untuk kompresi yang padat dan efisien di RAM kecil
    algorithm = "zstd"; 
    # Mengalokasikan batas maksimal zram sebesar 50% dari RAM fisik (8GB)
    memoryPercent = 50; 
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 12; # Agar kernel agresif memindahkan data idle ke zram yang cepat
    "vm.vfs_cache_pressure" = 50; # Mengurangi kecenderungan sistem membuang cache direktori/file dari RAM
  };

  programs.gamemode.enable = true;

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
}
