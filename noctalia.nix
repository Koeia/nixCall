{ inputs, ... }:
{
  home-manager.users.jctannu4 = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
      settings = {
        # Your bar is named "widgets", so it lives at [bar.widgets].
        bar.widgets = {
          thickness = 28;
          radius = 0;
          margin_ends = 0;
          widget_spacing = 7;
          background_opacity = 0.0;
          concave_edge_corners = false;
          font_family = "JetBrainsMono NFP";
          color = "primary";
          icon_color = "primary";
          border = "on_secondary";

          start = [ "control-center" "launcher" "network" "bluetooth" ];
          center = [ "workspaces" ];
          end = [
            "tray"
            "notifications"
            "clipboard"
            "bluetooth"
            "volume"
            "brightness"
            "battery"
            "clock"
            "session"
          ];

          # Scrolling on empty bar space changes screen brightness.
          dead_zone.actions = {
            scroll_up = "brightness-up";
            scroll_down = "brightness-down";
          };
        };

        shell = {
          panel_anchor_bar = "widgets";
          panel.transparency_mode = "soft";

          # Replaces the old shell.app_icon_colorize, which is now split
          # into one setting per place that shows app icons.
          launcher.colorize_icons = true;
          window_switcher.colorize_icons = true;
          screen_time_colorize_icons = true;
          polkit_colorize_icons = true;
        };
        dock.colorize_icons = true;
        notification.colorize_icons = true;
        audio.colorize_icons = true;

        dock.enabled = false;
        desktop_widgets.enabled = false;
        lockscreen_widgets.enabled = false;

        theme = {
          mode = "dark";
          source = "wallpaper";
          wallpaper_scheme = "m3-content";
          # Only used when source is "community" / "custom"; kept so
          # switching back in the GUI remembers your picks.
          community_palette = "Occult Umbral";
          custom_palette = "mintoday-nologo-mc";

          templates = {
            builtin_ids = [ "alacritty" "btop" "gtk3" "gtk4" "hyprland" "qt" ];
            community_ids = [ "zen-browser" "zed" "hyprtoolkit" "yazi" ];
          };
        };

        wallpaper.default.path = "/home/jctannu4/Wallpapers/black-hole-wallpaper.png";

        location.address = "Rocky Mount, NC";
        weather.unit = "imperial";

        # Names with a dash have to be quoted in Nix.
        widget = {
          "control-center".glyph = "brand-react";

          battery = {
            display_mode = "graphic";
            show_label = false;
            label_content = "rate";
            color = "primary";
            icon_color = "primary";
          };
          brightness.show_label = false;
          network.show_label = false;
          volume = {
            show_label = false;
            color = "primary";
            icon_color = "primary";
          };
          clock = {
            color = "primary";
            icon_color = "primary";
          };
          workspaces = {
            hide_when_empty = true;
            labels_only_when_occupied = true;
            colorize_icons = true;
          };
          tray.colorize_icons = true;
        };
      };
    };
  };
}
