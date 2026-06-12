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
          directory = "./Wallpapers";
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
          activeTemplates = [
            "hyprland"
            "alacritty"
            "fuzzel"
            "yazi"
            "zed"
          ];
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
          use12hourFormat = true;
          useFahrenheit = true;
        };
        idle = {
          enabled = true;
          lockTimeout = 60;
          lockCommand = "noctalia-shell ipc call lockScreen lock";
        };
      };
    };
  };
}
