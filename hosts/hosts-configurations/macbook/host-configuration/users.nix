{ host, ... }:

{ 
  # Define a common system user
  # GROUP
  users.groups.${host.username}.gid = 1000;
  # USER
  users.users.${host.username} = {
    isNormalUser = true;
    description = "${host.username}";
    uid = 1000;
    group = "${host.username}";
    home = "/home/${host.username}";
    createHome = true;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };


}
