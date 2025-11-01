{config, pkgs, ...}:

{
    imports = [ 
        ./config/chatnwhatnot.nix # This imports the chat and whatnot packages
        ./chatnwhatnot copy.nix # This imports the chat and whatnot packages
    ];

    home.username = "quin";
    home.homeDirectory = "/home/quin";
    home.stateVersion = "25.05";
    programs.bash = {
        enable = true;
        shellAliases = {
            wtf = "I HATE NIXXERS";
        };
    };
    home.packages = {
        pkgs.pulseaudio
        pkgs.playerctl

    };
}

