{...}:

{
 programs.niri.settings.outputs = {
    "DP-4" = {
      mode = {
        width = 2560;
        height = 1440;
        refresh = 60.0;
      };
      position = {
        x = 0;
        y = 0;
      };
      scale = 1.0;
    };

    "DP-3" = {
      mode = {
        width = 2560;
        height = 1440;
        refresh = 144.0;
      };
      position = {
        x = 2560;
        y = 0;
      };
      scale = 1.0;
    };

    "HDMI-A-2" = {
      enable = false;
    };
  };
}