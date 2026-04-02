{ pkgs, ... }:

let
  # Укажи здесь путь к своим обоям
  wallPath = "/home/anton/nixos-config/wallpapers/otherWallpaper/gruvbox/bush.jpg";
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading = true;
        grace = 0;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = wallPath;

          color = "rgba(60, 56, 54, 1.0)";
          blur_passes = 3;
          blur_size = 3;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      label = [
        {
          text = "$TIME";
          color = "rgba(251, 241, 199, 1.0)";
          font_size = 64;
          font_family = "Maple Mono";
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
