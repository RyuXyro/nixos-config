{ config, pkgs, ... }:

{ 
  networking.interfaces.eth0.useDHCP = true;

  services.httpd = {
    enable = true;
    adminAddr = "admin@exemova.org";
    
    # 1. Ganti domain menjadi exemova.org
    virtualHosts."exemova.org" = {
      documentRoot = "/var/www/exemova";
    };
  };

  networking = {
    # 2. Belokkan domain ke komputer sendiri (localhost)
    extraHosts = ''
      127.0.0.1 exemova.org
      ::1       exemova.org
    '';

    firewall.allowedTCPPorts = [ 80 443 ];

    # 3. Konfigurasi IP statis untuk interface tertentu
#    interfaces.vboxnet0 = {
#      ipv4.addresses = [ {
#        address = "12.12.12.2";
#        prefixLength = 24;
#      } ];
#    };

    # 4. Konfigurasi Gateway (opsional)
    # defaultGateway = {
    #   address = "12.12.12.1";
    #   interface = "enp0s8";
    # };

    # 5. Konfigurasi DNS Nameservers secara global untuk sistem
    # (Catatan: di Nix, pemisah elemen list menggunakan spasi, bukan koma)
    # nameservers = [ "8.8.8.8" "1.1.1.1" ];
  };
}
