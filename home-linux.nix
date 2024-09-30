{ pkgs, ... }: {
# This is required information for home-manager to do its job
  home = {
    stateVersion = "24.05"; # do not change this https://nix-community.github.io/home-manager/
      username = "chris";
    homeDirectory = "/home/chris";
    packages = with pkgs; [
      git
      wget
      nextcloud-client
      qownnotes
      keepassxc
      neovim
      tmux
      (nerdfonts.override { fonts = [ "Hack" "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
      nodejs_22         
      jdk22
      vlc
      k3b # cd ripping software
      brasero # disk burning
      abcde # command line cd ripper, example: abcde -o flac
      libbluray
      libdvdcss
      libcdaudio
      usbutils # lsusb
      lsscsi
      cdrkit
      cdrdao
      dvdplusrwtools
      cargo
      rustc
      gpodder # podcast app
      gcc
      # clang this had some kind of collision
      # cdrtools -- did not wan to build with this
    ];

# Tell it to map everything in the `config` directory in this
# repository to the `.config` in my home directory
  file.".config" = { source = ./config; recursive = true; };
  file.".tmux.conf" = { source = ./.tmux.conf; };

# setup git config
  file.".gitconfig" = {
    enable = true;
    text = ''
      [user]
        name = Chris Wininger
        email = chris.wininger@gmail.com
      [pull]
        rebase = false

      [push]
        default = current
    '';
  };

# environment variables
    sessionVariables = {
      TERM="xterm-256color";
    };
  };

# setup nerdfonts, needed for tree in neovim
  fonts.fontconfig.enable = true;

# This is to ensure programs are using ~/.config rather than
# /Users/<username/Library/whatever
  xdg.enable = true;

  programs.home-manager.enable = true;

# you could also use fish or bash, I'll stick with zsh because... mac
  programs.zsh.enable = true;
  programs.zsh.shellAliases = {
    vim = "nvim";
  };
}

