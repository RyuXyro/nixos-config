{ config, pkgs, ... }:

{ 
  networking.interfaces.eth0.useDHCP = true;

  services.httpd = {
    enable = true;
    adminAddr = "admin@shiko.io";
    
    # 1. Ganti domain menjadi shiko.io
    virtualHosts."shiko.io" = {
      documentRoot = "/var/www/shiko";
    };
  };

  networking = {
    # 2. Belokkan domain ke komputer sendiri (localhost)
    extraHosts = ''
      127.0.0.1 shiko.io
      ::1       shiko.io
    '';

    firewall.allowedTCPPorts = [ 80 443 ];
  };
}
