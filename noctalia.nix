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
      mError = "#e78284";            # Red
      mOnError = "#232634";          # Crust (dark)
      mOnPrimary = "#232634";        # Text on light primary
      mOnSecondary = "#232634";      # Text on light secondary
      mOnSurface = "#c6d0f5";        # Text
      mOnSurfaceVariant = "#a5adce"; # Subtext
      mOnTertiary = "#232634";       # Text on tertiary

      mOutline = "#737994";          # Outline
      mPrimary = "#8caaee";          # Blue
      mSecondary = "#babbf1";        # Lavender
      mTertiary = "#ef9f76";         # Peach
      mSurface = "#303446";          # Base
      mSurfaceVariant = "#292c3c";   # Mantle
      mShadow = "#232634";           # Crust

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