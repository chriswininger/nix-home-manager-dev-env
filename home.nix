{ pkgs, ... }: {
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "24.05"; # do not change this https://nix-community.github.io/home-manager/
    username = "chris";
    homeDirectory = "/Users/chris";
    packages = [
	pkgs.git
        pkgs.neovim
        pkgs.tmux
    ];

    # Tell it to map everything in the `config` directory in this
    # repository to the `.config` in my home directory
    file.".config" = { source = ./config; recursive = true; };
  };

  # This is to ensure programs are using ~/.config rather than
  # /Users/<username/Library/whatever
  xdg.enable = true;

  programs.home-manager.enable = true;

  # you could also use fish or bash, I'll stick with zsh because... mac
  programs.zsh.enable = true;

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
  };
}

