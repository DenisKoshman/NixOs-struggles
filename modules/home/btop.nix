{ ... }:
{
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "matcha-dark-sea";
      theme_background = false;
      update_ms = 500;
      rounded_corners = true;
    };
  };
}
