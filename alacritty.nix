{ lib, pkgs, ... }:
{
   home.packages = with pkgs; [
    # cli
    fastfetch
    yt-dlp
    ffmpeg-full
    zip
    xz
    unzip
    p7zip
    glow
    curl
    bluez
    rar
    gnutar
    cava
    
  ];
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = lib.mkOrder 1500 "
      fastfetch
    ";
    oh-my-zsh = {
      enable = true;
      theme = "xiong-chiamiov-plus";
      plugins = [
        "sudo"
      ];
    }; 
  };
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 8;
          y = 8;
        }; 
        decorations = "none";
        dynamic_title = true;
        opacity = 0.5;
      };


      terminal = {
        shell = {
          program = "${pkgs.zsh}/bin/zsh";
          args = [ "-l" ]; # "-l" = login shell (optional, but good practice)
        };
      };

  
    };
    theme = "catppuccin_macchiato";

  };
}
