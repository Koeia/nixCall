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
          density = "compact";
          position = "top";
          showCapysule = false;
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
                labelMode = "none";
              }
            ];
            right = [
              {
                alwaysShowPercentage = false;
                id = "Battery";
                warningThreshold = 30;
              }
              {
                formatHorizontal = "HH:mm";
                formatVertical = "HH mm";
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
        colorSchemes = {
          useWallpaperColors = true;
          darkMode = true;
        };
        general = {
          avatarImage = "/home/jctannu4/.face";
          radiusRatio = 0.2;
        };
        location = {
          monthBeforeDay = true;
          name = "Rocky Mount, North Carolina";
        };
      };
    };
  };
}
