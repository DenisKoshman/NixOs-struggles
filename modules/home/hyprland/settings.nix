{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "ALT";

    input = {
      kb_layout = "us,ru";
      kb_options = "grp:alt_caps_toggle";

      repeat_delay = 300;
      numlock_by_default = true;

      follow_mouse = 0;
      mouse_refocus = 0;
      float_switch_override_focus = 0;

      touchpad = {
        disable_while_typing = false;
        natural_scroll = true;
      };
    };

    general = {
      layout = "dwindle";

      gaps_in = 6;
      gaps_out = 12;
      border_size = 2;

      "col.active_border" = "rgb(98971A) rgb(CC241D) 45deg";
      "col.inactive_border" = "0x00000000";
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = false;

      focus_on_activate = true;
      middle_click_paste = false;

      disable_autoreload = false;
    };

    dwindle = {
      force_split = 2;
      preserve_split = true;
      use_active_for_splits = true;
    };

    master = {
      new_status = "master";
    };

    decoration = {
      rounding = 0;

      blur = {
        enabled = true;

        size = 3;
        noise = 0;
        passes = 2;
        contrast = 1.4;
        brightness = 1;

        xray = true;
      };

      shadow = {
        enabled = true;

        range = 20;
        render_power = 3;

        offset = "0 2";
        color = "rgba(00000055)";
      };
    };

    animations = {
      enabled = true;

      bezier = [
        "fluent_decel, 0.1, 0.9, 0.2, 1"
        "easeOutCirc, 0, 0.55, 0.45, 1"
        "easeOutCubic, 0.22, 1, 0.36, 1"
        "fade_curve, 0.3, 0, 0.7, 1"
      ];

      animation = [
        # name, enable, speed, curve, style

        # Windows
        "windowsIn,   0, 2, easeOutCubic,  popin 20%" # 8 -> 4 (остается выключенным, но готов к быстрому старту)
        "windowsOut,  0, 2, fluent_decel,  popin 80%" # 8 -> 4
        "windowsMove, 1, 1, fluent_decel, slide" # 4 -> 2 (очень быстрый отклик при перетаскивании)

        # Fade
        "fadeIn,      1, 2,   fade_curve" # 6 -> 3
        "fadeOut,     1, 2,   fade_curve" # 6 -> 3
        "fadeSwitch,  0, 1,   easeOutCirc" # 2 -> 1
        "fadeShadow,  1, 5,  easeOutCirc" # 20 -> 10
        "fadeDim,     1, 2,   fluent_decel" # 8 -> 4

        # Workspaces
        "workspaces,  1, 2,   easeOutCubic, fade" # 8 -> 4
      ];
    };

    xwayland = {
      force_zero_scaling = true;
    };

  };
  #gamemode
  wayland.windowManager.hyprland.extraConfig = ''
    submap = game

    # В этом режиме ВСЕ клавиши пробрасываются в игру.
    # Работает только одна кнопка — выход из режима.
    bind = $mod, F1, exec, hyprctl --batch 'keyword animations:enabled 1; keyword decoration:shadow:enabled 1; keyword decoration:blur:enabled 1'
    bind = $mod, F1, submap, reset

    submap = reset
  '';
}
