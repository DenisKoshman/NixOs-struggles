{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Multimedia
    audacity
    media-downloader
    obs-studio
    pavucontrol
    soundwireserver
    vlc
    telegram-desktop
    anki
    google-chrome

    ## Office
    libreoffice
    gnome-calculator

    ## Utility
    dconf-editor
    gnome-disk-utility
    popsicle
    mission-center # GUI resources monitor
    zenity
  ];
}
