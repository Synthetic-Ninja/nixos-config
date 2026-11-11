{ pkgs, config, ... }:
{
  # OPTIONAL module. Do not enable at the same time as another display manager.
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd ${config.programs.niri.package}/bin/niri-session";
      user = "greeter";
    };
  };
  
  systemd.user.services.niri.enableDefaultPath = false;
}
