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

        mShadow = "#050304";           # nearly black — strong shadow depth
        mSurface = "#241712";          # warm dark brown — main background
        mSurfaceVariant = "#3a251e";   # medium tone for panels or cards

        # 🎨 Brand Tones — distinct and layered
        mPrimary = "#9b5a34ff";        # warm medium orange — main brand color
        mSecondary = "#432C24";        # rich warm bistre — clear contrast to primary
        mTertiary = "#b97a5d";         # warm mid-accent for highlights (light bistre)

        # 🩶 Text + On-colors (Catppuccin Frappé adapted for readability)
        mOnPrimary = "#e6d8cf";        # readable light beige text on black
        mOnSecondary = "#f2e4dc";      # off-white text on brownish tone
        mOnSurface = "#d8cfc8";        # slightly muted white text for main content
        mOnSurfaceVariant = "#bbaea6"; # secondary/subdued text
        mOnTertiary = "#1a0f0a";       # dark text on light tertiary accents

        # ⚠️ Error / Outline
        mError = "#e78284";            # from Catppuccin Frappé
        mOnError = "#1f1410";          # dark contrast text on error
        mOutline = "#7b5548";          # visible warm border / separator

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