{ pkgs, config, ... }:

let
  dotfiles =
    "${config.home.homeDirectory}/nixos-config/dotfiles/warp-terminal";

  link = path:
    config.lib.file.mkOutOfStoreSymlink
      "${dotfiles}/${path}";
in
{
  home.packages = [
    (pkgs.symlinkJoin {
      name = "warp-wayland";

      paths = [ pkgs.warp-terminal ];

      nativeBuildInputs = [ pkgs.makeWrapper ];

      postBuild = ''
        wrapProgram $out/bin/warp-terminal \
          --prefix LD_LIBRARY_PATH : "${pkgs.wayland}/lib" \
          --set WARP_ENABLE_WAYLAND 1
      '';
    })
  ];

  # Симлинки на настройки Warp
  xdg.configFile = {
    "warp-terminal/settings.toml".source =
      link "settings.toml";

    "warp-terminal/keybindings.yaml".source =
      link "keybindings.yaml";
  };
}
