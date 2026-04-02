{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    settings.monitor = [ ",1920x1080@100,auto,1" ];

    extraConfig = ''
      # hyprlang noerror true
        source = ~/.config/hypr/monitors.conf
        source = ~/.config/hypr/workspaces.conf
      # hyprlang noerror false
    '';
  };

  home.packages = with pkgs; [ nwg-displays ];
}
