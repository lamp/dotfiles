{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  home.packages = with pkgs; [
    alacritty
    neovim
    # tmux
    tmux

    # Programming langues
    #clj
    joker
    clj-kondo
    leiningen
    babashka
    clojure-lsp
    # rust
    cargo
    # ruby
    #rbenv
    # python/neovim
    python
    vimPlugins.vim-plug
    # General
    fzf
    lazygit
    jq
    fd
    silver-searcher
    autojump
    zsh-z
    ctags
    direnv
    scmpuff
    pet
    wget
    tree
  ];

  home.file.".tmux.conf".source = ../../.tmux.conf;
  home.file.".zshrc".source = ../../.zshrc;
  home.file.".gitignore".source = ../../.gitignore;
  home.file.".gitconfig".source = ../../.gitconfig;
  home.file.".ctags".source = ../../.ctags;
  home.file.".config/nvim/init.vim".source = ../../nvim/init.vim;
  home.file.".config/alacritty/alacritty.yml".source = ../../alacritty/alacritty.yml;
  home.file.".lein/profiles.clj".source = ../../profiles.clj;
  home.file.".shadow-cljs/config.edn".source = ../../shadow-cljs/config.edn;


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  programs.neovim = {
    withPython3 = true;
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    escapeTime = 0;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.resurrect
      tmuxPlugins.pain-control
      tmuxPlugins.yank
    ];
  };
}

