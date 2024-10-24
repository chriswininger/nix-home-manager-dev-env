{ pkgs, ... }: let 
  # Import the utils.nix file
  utils = import ./my-scripts.nix { pkgs = pkgs; };
in {
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "24.05"; # do not change this https://nix-community.github.io/home-manager/
      username = "chris";
    homeDirectory = "/Users/chris";
    packages = with pkgs; [
      git
        neovim
        tmux
        (nerdfonts.override { fonts = [ "Hack" "FiraCode" "DroidSansMono" ]; })
        nodejs_22         
        jdk22 
        kotlin
        rustup
        (ruby.withPackages (ps: with ps; [ cocoapods ]))
        postgresql_16
        ansible
        just
        utils.tcls
    ]; # ++ utils.tcls; # Append the tcls package to the list of packages

    # Tell it to map everything in the `config` directory in this
    # repository to the `.config` in my home directory
    file.".config" = { source = ./config; recursive = true; };
    file.".tmux.conf" = { source = ./.tmux.conf; };

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

