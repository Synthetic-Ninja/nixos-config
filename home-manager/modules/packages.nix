{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git
    ripgrep
    fd
    fastfetch
    vim
    bruno
    google-chrome
    firefox
    telegram-desktop
    pyenv
    uv
    openvpn
    python313
    libreoffice
  ];
}
