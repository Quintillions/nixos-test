{config, pkgs, ...}:

{
    imports = [ 
        ./chatnwhatnot.nix # This imports the chat and whatnot packages
        ./niri.nix # This imports the chat and whatnot packages
        ./fonts.nix # imports fonts
    ];

    home.username = "quin";
    home.homeDirectory = "/home/quin";
    home.stateVersion = "25.05";
    programs.bash = {
        enable = true;
        shellAliases = {
            wtf = "echo 'what the fish' ";
        };
    };
    home.packages = [
        pkgs.pulseaudio
        pkgs.playerctl

    ];
}


