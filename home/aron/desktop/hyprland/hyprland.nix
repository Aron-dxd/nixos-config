{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = "eDP-1,1920x1080@60,0x0,1";

      env = [
        "GDK_BACKEND,wayland,x11,*"
        "QT_QPA_PLATFORM,wayland;xcb"
        "CLUTTER_BACKEND,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_SCALE_FACTOR,1"
        "GDK_SCALE,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "NVD_BACKEND,direct"
        "MOZ_ENABLE_WAYLAND,1"
        "AQ_NO_MODIFIERS,1"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };
        blur = {
          enabled = true;
          size = 6;
          passes = 2;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "snap, 0.25, 1.0, 0.5, 1.0"
          "ease, 0.4, 0.0, 0.2, 1.0"
        ];
        animation = [
          "windows, 1, 2, snap, slide"
          "windowsOut, 1, 2, snap, slide"
          "windowsMove, 1, 2, snap"
          "fade, 1, 3, ease"
          "fadeOut, 1, 3, ease"
          "workspaces, 1, 3, ease, slidefade 20%"
          "layers, 1, 2, ease, fade"
          "layersOut, 1, 2, ease, fade"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = false;
        vfr = true;
        vrr = 2;
        mouse_move_enables_dpms = true;
        focus_on_activate = false;
        initial_workspace_tracking = 0;
        middle_click_paste = false;
      };

      group = {
        groupbar = {
          enabled = true;
          font_size = 10;
          height = 16;
          gradients = true;
          render_titles = true;
          text_offset = 0;
          rounding = 3;
          indicator_height = 3;
          indicator_gap = 2;
          gaps_in = 2;
          gaps_out = 2;
        };
      };

      input = {
        kb_layout = "us";
        kb_variant = "altgr-intl";
        repeat_rate = 50;
        repeat_delay = 300;
        numlock_by_default = true;
        float_switch_override_focus = false;
        follow_mouse = 1;
        accel_profile = "flat";
        sensitivity = 0;
        touchpad = {
          middle_button_emulation = true;
          drag_lock = false;
          natural_scroll = true;
        };
      };

      cursor = {
        no_hardware_cursors = 1;
        enable_hyprcursor = true;
        warp_on_change_workspace = 2;
        no_warps = true;
        sync_gsettings_theme = true;
      };

      xwayland = {
        enabled = true;
        force_zero_scaling = true;
      };

      binds = {
        allow_workspace_cycles = true;
        pass_mouse_when_bound = false;
      };

      gestures = {
        gesture = "3, horizontal, workspace";
      };
    };

    extraConfig = ''
      source = ~/.config/hypr/keybindings.conf
      source = ~/.config/hypr/window-rules.conf
      source = ~/.config/hypr/autostart.conf
    '';
  };

  xdg.configFile = {
    "hypr/keybindings.conf".source = ./keybindings.conf;
    "hypr/window-rules.conf".source = ./window-rules.conf;
    "hypr/autostart.conf".source = ./autostart.conf;
  };
}
