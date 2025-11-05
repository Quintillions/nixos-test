{ pkgs, inputs, ... }:
{
  # install package
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
    inputs.matugen.packages.${system}.default
    # ... maybe other stuff
  ];

  home-manager.users.quin = {
    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
      inputs.niri.homeModules.niri          # ✅ load Niri’s Home Manager module
    ];
    home.file.".config/rofi".source = ./config/rofi;
    # configure options
    programs.noctalia-shell = {
      enable = true;
      colors = {
        # ⚫ Custom “Black–Licorice–Bistre” Palette (Readable Variant)
        mError = "#b9725d";            # warm readable error color
        mOnError = "#070106";          # dark text for error surfaces

        mOnPrimary = "#ded1c8";        # light text on dark primary
        mOnSecondary = "#ded1c8";      # light text on dark secondary
        mOnSurface = "#e2d0ca";        # primary text color
        mOnSurfaceVariant = "#c6a195"; # secondary text color
        mOnTertiary = "#e7c4b6";       # soft accent text

        mOutline = "#604337";          # subtle outline / border
        mPrimary = "#1c232b";          # 🩵 deep cool charcoal (distinguishable)
        mSecondary = "#432C24";        # 🟤 warm bistre accent
        mTertiary = "#bda491";         # beige highlight / tertiary accent

        mShadow = "#070106";           # near-black shadow
        mSurface = "#150B07";          # very dark background
        mSurfaceVariant = "#2B211A";   # slightly lighter variant
      };  
      settings = {
         bar = {
          position = "left";
          backgroundOpacity = 1;
          monitors = [ ];
          density = "default";
          showCapsule = true;
          floating = false;
          marginVertical = 0.25;
          marginHorizontal = 0.25;
          outerCorners = true;
          exclusive = true;

          widgets = {
            left = [
              {
                id = "SystemMonitor";
              }
              {
                id = "ActiveWindow";
              }
              {
                id = "MediaMini";
              }
            ];

            center = [
              {
                id = "Workspace";
              }
            ];

            right = [
              {
                id = "ScreenRecorder";
              }
              {
                id = "Tray";
              }
              {
                id = "NotificationHistory";
              }
              {
                id = "Battery";
              }
              {
                id = "Volume";
              }
              {
                id = "Brightness";
              }
              {
                id = "Clock";
              }
              {
                id = "ControlCenter";
              }
            ];
          };
        };


        ui = {
          fontDefault = "JetBrainsMonoNL Nerd Font Mono";
          fontFixed = "DejaVu Sans Mono";
          fontDefaultScale = 1;
          fontFixedScale = 1;
          tooltipsEnabled = true;
          panelsAttachedToBar = true;
          panelsOverlayLayer = false;
        };


        location = {
          name = "Manila";
          weatherEnabled = true;
          useFahrenheit = false;
          use12hourFormat = false;
          showWeekNumberInCalendar = false;
          showCalendarEvents = true;
          showCalendarWeather = true;
          analogClockInCalendar = false;
          firstDayOfWeek = -1;
        };


        wallpaper = {
          enabled = true;
          overviewEnabled = true;
          directory = "~/wallpapers";
          enableMultiMonitorDirectories = false;
          recursiveSearch = false;
          setWallpaperOnAllMonitors = true;
          defaultWallpaper = "~/wallpapers/default.jpg";
          fillMode = "crop";
          fillColor = "#000000";
          randomEnabled = false;
          randomIntervalSec = 300;
          transitionDuration = 1500;
          transitionType = "random";
          transitionEdgeSmoothness = 0.05;
          monitors = [ ];
          panelPosition = "follow_bar";
        };

        appLauncher = {
          enableClipboardHistory = false;
          position = "top_center";
          backgroundOpacity = 1;
          pinnedExecs = [ ];
          useApp2Unit = false;
          sortByMostUsed = true;
          terminalCommand = "xterm -e";
          customLaunchPrefixEnabled = false;
          customLaunchPrefix = "";
        };
        controlCenter = {
          position = "close_to_bar_button";
          shortcuts = {
            left = [
              {
                id = "WiFi";
              }
              {
                id = "Bluetooth";
              }
              {
                id = "ScreenRecorder";
              }
              {
                id = "WallpaperSelector";
              }
            ];
            right = [
              {
                id = "Notifications";
              }
              {
                id = "PowerProfile";
              }
              {
                id = "KeepAwake";
              }
              {
                id = "NightLight";
              }
            ];
          };
          cards = [
            {
              enabled = true;
              id = "profile-card";
            }
            {
              enabled = true;
              id = "shortcuts-card";
            }
            {
              enabled = true;
              id = "audio-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
            {
              enabled = true;
              id = "media-sysmon-card";
            }
          ];
        };


        dock = {
          enabled = true;
          displayMode = "auto_hide";
          backgroundOpacity = 1;
          floatingRatio = 1;
          size = 1;
          onlySameOutput = true;
          monitors = [ ];
          pinnedApps = [ ];
          colorizeIcons = false;
        };


        network = {
          wifiEnabled = true;
        };

        notifications = {
          doNotDisturb = false;
          monitors = [ ];
          location = "top_right";
          overlayLayer = true;
          backgroundOpacity = 1;
          respectExpireTimeout = false;
          lowUrgencyDuration = 3;
          normalUrgencyDuration = 8;
          criticalUrgencyDuration = 15;
        };

        battery = {
          chargingMode = 0;
        };
      };
      
      # this may also be a string or a path to a JSON file.
    };

    
                
  };
}