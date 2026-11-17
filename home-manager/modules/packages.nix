{ pkgs, ... }:
{
  home.packages = with pkgs; [
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
    python313
    libreoffice
  ];
}
