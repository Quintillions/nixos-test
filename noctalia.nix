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
        # you must set ALL of these
        mError = "#ed8796";          
        mOnError = "#24273a";        
        mOnPrimary = "#24273a";     
        mOnSecondary = "#24273a";  
        mOnSurface = "#cad3f5";    
        mOnSurfaceVariant = "#b8c0e0";
        mOnTertiary = "#24273a";   
        mOutline = "#5b6078";    
        mPrimary = "#8aadf4";        
        mSecondary = "#a6da95";      
        mShadow = "#181926";         
        mSurface = "#24273a";       
        mSurfaceVariant = "#1e2030"; 
        mTertiary = "#f5a97f";      
      };
      settings = {
         bar = {
          position = "top";
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
          directory = "";
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
          position = "top";
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