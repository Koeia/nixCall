{ pkgs, inputs, ... }:
{
  home-manager.users.jctannu4 = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia-shell = {
      enable = true;
      settings = {
        bar = {
          backgroundOpacity = 0;
          useSeparateOpacity = true;
          density = "compact";
          position = "top";
          showCapsule = false;
          widgets = {
            left = [
              {
                id = "ControlCenter";
                useDistroLogo = true;
              }
              {
                id = "Network";
              }
              {
                id = "Bluetooth";
              }
            ];
            center = [
              {
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "index";
              }
            ];
            right = [
              {
                alwaysShowPercentage = true;
                id = "Battery";
                warningThreshold = 30;
              }
              {
                formatHorizontal = "h:mm AP";
                formatVertical = "h:mm AP";
                id = "Clock";
                useMonospacedFont = true;
                usePrimaryColor = true;
              }
            ];
          };
        };
        wallpaper = {
          enabled = true;
          directory = "~/Wallpapers";
          monitorDirectories = [ ];
          viewMode = "single";
          setWallpaperOnAllMonitors = true;
          linkLightAndDarkWallpapers = true;
          fillMode = "crop";
          brightness = {
            brightnessStep = 5;
            enforceMinimum = true;
            enableDdcSupport = false;
            backlightDeviceMappings = [ ];
          };
        };
        templates = {
          "yazi" = true;
          "alacritty" = true;
          "zed" = true;
          "fuzzel" = true;
          "btop" = true;
          enableUserTheming = true;
        };
        colorSchemes = {
          useWallpaperColors = true;
          darkMode = true;
        };
        general = {
          avatarImage = "/home/jctannu4/.face";
          radiusRatio = 0.2;
          clockFormat = "h:mm AP";
        };
        location = {
          monthBeforeDay = true;
          name = "Rocky Mount, North Carolina";
          use12hourFormat = true;
          useFahrenheit = true;
        };
        idle = {
          enabled = true;
          lockTimeout = 120;
          lockCommand = "noctalia-shell ipc call lockScreen lock";
        };
      };
    };
  };
}
