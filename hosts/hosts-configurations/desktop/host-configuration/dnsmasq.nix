{ ... }:

{
  networking.networkmanager.dns = "none";
  networking.nameservers = [ "127.0.0.1" ];
  networking.resolvconf.enable = true;

  services.resolved.enable = false;

  services.dnsmasq = {
    enable = true;
    resolveLocalQueries = false;

    settings.conf-file = "/etc/dnsmasq/dnsmasq.conf";
  };
}
