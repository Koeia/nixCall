{ lib, ... }:
let
  # Helpers for writing Lua from Nix.
  # `inline` passes text through as raw Lua instead of a quoted string.
  inline = lib.generators.mkLuaInline;
  toLua = lib.generators.toLua { };

  # hl.dsp.<name>(<args>) / hl.dsp.<name>()
  dsp = name: args: inline "hl.dsp.${name}(${toLua args})";
  dsp0 = name: inline "hl.dsp.${name}()";
  exec = cmd: dsp "exec_cmd" cmd;

  # hl.bind(key, action[, opts])
  bind = key: action: {
    _args = [
      key
      action
    ];
  };
  bindWith = key: action: opts: {
    _args = [
      key
      action
      opts
    ];
  };

  mod = "SUPER";
  ipc = "noctalia msg ";

  terminal = "alacritty";
  ssh = "xpipe";
  browser = "zen";
  fileManager = "alacritty -e yazi";
  editor = "zeditor";

  # Media keys work on the lock screen and repeat when held.
  mediaKey = {
    locked = true;
    repeating = true;
  };

  # SUPER + 1..0 -> workspace 1..10, SUPER + SHIFT + 1..0 -> move window there.
  workspaceBinds = lib.concatLists (
    lib.genList (
      n:
      let
        ws = n + 1;
        key = toString (lib.mod ws 10);
      in
      [
        (bind "${mod} + ${key}" (dsp "focus" { workspace = ws; }))
        (bind "${mod} + SHIFT + ${key}" (dsp "window.move" { workspace = ws; }))
      ]
    ) 10
  );
in
{
  home-manager.users.jctannu4 = {
    wayland.windowManager.hyprland = {
      enable = true;
      configType = "lua";

      # Hyprland itself is installed by the NixOS module (programs.hyprland in
      # configuration.nix). null stops Home Manager installing a second,
      # possibly different, version.
      package = null;
      portalPackage = null;

      # Exports WAYLAND_DISPLAY etc. to systemd and starts
      # hyprland-session.target — replaces the two exec lines from the old file.
      systemd.enable = true;

      extraConfig = ''
        -- Noctalia colors (generated at ~/.config/hypr/noctalia.lua)
        local ok, noctalia = pcall(require, "noctalia")
        if ok then noctalia.apply_theme() end
      '';
      settings = {
        monitor = {
          output = "";
          mode = "preferred";
          position = "auto";
          scale = "1";
        };

        config = {
          general = {
            gaps_in = 5;
            gaps_out = 5;
            border_size = 2;
            resize_on_border = false;
            allow_tearing = false;
            layout = "dwindle";
          };

          decoration = {
            rounding = 0;
            dim_around = 0.4;
            rounding_power = 2;
            active_opacity = 1.0;
            inactive_opacity = 0.8;
            shadow = {
              enabled = true;
              range = 4;
              render_power = 3;
              # Nix has no hex numbers, so pass the literal through as Lua.
              color = inline "0xee1a1a1a";
            };
            blur = {
              enabled = true;
              size = 3;
              passes = 1;
              vibrancy = 0.1696;
            };
          };

          animations.enabled = true;
          dwindle.preserve_split = true;
          master.new_status = "master";
          scrolling.fullscreen_on_one_column = true;

          misc = {
            force_default_wallpaper = 1;
            disable_hyprland_logo = true;
          };

          input = {
            kb_layout = "us";
            kb_variant = "";
            kb_model = "";
            kb_options = "caps:swapescape";
            kb_rules = "";
            follow_mouse = 1;
            sensitivity = 0;
            touchpad = {
              natural_scroll = true;
              disable_while_typing = true;
            };
          };
        };

        # Curves are defined before animations: Home Manager puts "curve"
        # at the top of the file (importantPrefixes).
        curve = [
          {
            _args = [
              "easeOutQuint"
              {
                type = "bezier";
                points = [
                  [
                    0.23
                    1
                  ]
                  [
                    0.32
                    1
                  ]
                ];
              }
            ];
          }
          {
            _args = [
              "easeInOutCubic"
              {
                type = "bezier";
                points = [
                  [
                    0.65
                    0.05
                  ]
                  [
                    0.36
                    1
                  ]
                ];
              }
            ];
          }
          {
            _args = [
              "linear"
              {
                type = "bezier";
                points = [
                  [
                    0
                    0
                  ]
                  [
                    1
                    1
                  ]
                ];
              }
            ];
          }
          {
            _args = [
              "almostLinear"
              {
                type = "bezier";
                points = [
                  [
                    0.5
                    0.5
                  ]
                  [
                    0.75
                    1
                  ]
                ];
              }
            ];
          }
          {
            _args = [
              "quick"
              {
                type = "bezier";
                points = [
                  [
                    0.15
                    0
                  ]
                  [
                    0.1
                    1
                  ]
                ];
              }
            ];
          }
          {
            _args = [
              "easy"
              {
                type = "spring";
                mass = 1;
                stiffness = 71.2633;
                dampening = 15.8273644;
              }
            ];
          }
        ];

        animation =
          let
            anim =
              leaf: speed: curve: extra:
              {
                inherit leaf speed;
                enabled = true;
              }
              // curve
              // extra;
            bez = name: { bezier = name; };
          in
          [
            (anim "global" 10 (bez "default") { })
            (anim "border" 5.39 (bez "easeOutQuint") { })
            (anim "windows" 4.79 (bez "easeOutQuint") { })
            (anim "windowsIn" 2.5 (bez "easeOutQuint") { style = "popin 87%"; })
            (anim "windowsOut" 1.49 (bez "linear") { style = "popin 87%"; })
            (anim "fadeIn" 1.0 (bez "almostLinear") { })
            (anim "fadeOut" 1.46 (bez "almostLinear") { })
            (anim "fade" 3.03 (bez "quick") { })
            (anim "layers" 3.81 (bez "easeOutQuint") { })
            (anim "layersIn" 4 (bez "easeOutQuint") { style = "fade"; })
            (anim "layersOut" 1.5 (bez "linear") { style = "fade"; })
            (anim "fadeLayersIn" 1.79 (bez "almostLinear") { })
            (anim "fadeLayersOut" 1.39 (bez "almostLinear") { })
            (anim "workspaces" 1.94 (bez "almostLinear") { style = "fade"; })
            (anim "workspacesIn" 1.21 (bez "almostLinear") { style = "fade"; })
            (anim "workspacesOut" 1.94 (bez "almostLinear") { style = "fade"; })
            (anim "zoomFactor" 7 (bez "quick") { })
          ];

        gesture = {
          fingers = 3;
          direction = "horizontal";
          action = "workspace";
        };

        device = {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        };

        layer_rule = [
          {
            name = "noctalia";
            match.namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$";
            no_anim = true;
            ignore_alpha = 0.5;
            blur = true;
            blur_popups = true;
          }
          {
            name = "noctalia-panel-dim";
            match.namespace = "^noctalia-(panel|attached-panel)$";
            dim_around = true;
          }
        ];
        window_rule = [
          {
            name = "suppress-maximize-events";
            match.class = ".*";
            suppress_event = "maximize";
          }
          {
            name = "fix-xwayland-drags";
            match = {
              class = "^$";
              title = "^$";
              xwayland = true;
              float = true;
              fullscreen = false;
              pin = false;
            };
            no_focus = true;
          }
          {
            name = "move-hyprland-run";
            match.class = "hyprland-run";
            move = "20 monitor_h-120";
            float = true;
          }
        ];

        bind = [
          # Apps
          (bind "${mod} + T" (exec terminal))
          (bind "${mod} + B" (exec browser))
          (bind "${mod} + X" (exec ssh))
          (bind "${mod} + C" (exec editor))
          (bind "${mod} + F" (exec fileManager))
          (bind "${mod} + M" (
            exec "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
          ))

          # Noctalia
          (bind "${mod} + SPACE" (exec "${ipc}panel-toggle launcher"))
          (bind "${mod} + Y" (exec "${ipc}panel-toggle wallpaper"))
          (bind "${mod} + Equal" (exec "${ipc}calendar toggle"))
          (bind "${mod} + grave" (exec "${ipc}panel-toggle control-center"))
          (bind "${mod} + L" (exec "${ipc}session lock"))
          (bind "${mod} + SHIFT + M" (exec "${ipc}control-center toggle system"))

          # Windows
          (bind "${mod} + Q" (dsp0 "window.close"))
          (bind "${mod} + W" (dsp "window.float" { action = "toggle"; }))
          (bind "${mod} + P" (dsp0 "window.pseudo"))
          (bind "${mod} + R" (dsp "layout" "togglesplit")) # dwindle only
          (bind "${mod} + left" (dsp "focus" { direction = "left"; }))
          (bind "${mod} + right" (dsp "focus" { direction = "right"; }))
          (bind "${mod} + up" (dsp "focus" { direction = "up"; }))
          (bind "${mod} + down" (dsp "focus" { direction = "down"; }))

          # Special workspace
          (bind "${mod} + S" (dsp "workspace.toggle_special" "magic"))
          (bind "${mod} + SHIFT + S" (dsp "window.move" { workspace = "special:magic"; }))

          # Mouse
          (bind "${mod} + mouse_down" (dsp "focus" { workspace = "e+1"; }))
          (bind "${mod} + mouse_up" (dsp "focus" { workspace = "e-1"; }))
          (bindWith "${mod} + mouse:272" (dsp0 "window.drag") { mouse = true; })
          (bindWith "${mod} + mouse:273" (dsp0 "window.resize") { mouse = true; })

          # Media / brightness keys
          (bindWith "XF86AudioRaiseVolume" (exec "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+") mediaKey)
          (bindWith "XF86AudioLowerVolume" (exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-") mediaKey)
          (bindWith "XF86AudioMute" (exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle") mediaKey)
          (bindWith "XF86AudioMicMute" (exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle") mediaKey)
          (bindWith "XF86MonBrightnessUp" (exec "brightnessctl -e4 -n2 set 5%+") mediaKey)
          (bindWith "XF86MonBrightnessDown" (exec "brightnessctl -e4 -n2 set 5%-") mediaKey)
          (bindWith "XF86AudioNext" (exec "playerctl next") { locked = true; })
          (bindWith "XF86AudioPause" (exec "playerctl play-pause") { locked = true; })
          (bindWith "XF86AudioPlay" (exec "playerctl play-pause") { locked = true; })
          (bindWith "XF86AudioPrev" (exec "playerctl previous") { locked = true; })
        ]
        ++ workspaceBinds;
      };
    };
  };
}
