{ ... }:

{
    services.openvpn.servers.work = {
        autoStart = false;

        config = ''
            config /etc/openvpn/client.conf
        '';

        updateResolvConf = false;

    };

    users.groups.openvpn = {};

    users.users.openvpn = {
        isSystemUser = true;
        group = "openvpn";
    };
}
