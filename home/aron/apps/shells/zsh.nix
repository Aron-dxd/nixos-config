{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh"; 
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      save = 10000;
      path = "${config.xdg.configHome}/zsh/.zsh_history";
      append = true;
    };

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#hiroshima";

      shell-sops = "nix-shell /etc/nixos/shells/sops.nix";
    };

    plugins = [
      {
        name = "zsh-fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
      {
        name = "zsh-autopair";
        src = pkgs.zsh-autopair;
        file = "share/zsh/zsh-autopair/autopair.zsh";
      }
      {
        name = "you-should-use";
        src = pkgs.zsh-you-should-use;
        file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
      }
      {
        name = "nix-zsh-completions";
        src = pkgs.nix-zsh-completions;
        file = "share/zsh/plugins/nix/nix.plugin.zsh";
      }
      {
        name = "zsh-history-substring-search";
        src = pkgs.zsh-history-substring-search;
        file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh";
      }
      {
        name = "zsh-nix-shell";
        src = pkgs.zsh-nix-shell;
        file = "share/zsh-nix-shell/nix-shell.plugin.zsh";
      }
    ];

    initContent = ''
      # Insert last word with Alt+.
      bindkey '\e.' insert-last-word

      # Esc Esc to prepend sudo
      sudo-command-line() {
        [[ -z $BUFFER ]] && zle up-history
        if [[ $BUFFER == sudo\ * ]]; then
          LBUFFER="''${LBUFFER#sudo }"
        else
          LBUFFER="sudo $LBUFFER"
        fi
      }
      zle -N sudo-command-line
      bindkey '\e\e' sudo-command-line

      # Resilient History Substring Search Keybindings
      # Using terminfo prevents the '^[[A' literal text glitch
      if [[ -n "''${terminfo[kcuu1]}" ]]; then
        bindkey "''${terminfo[kcuu1]}" history-substring-search-up
      fi
      if [[ -n "''${terminfo[kcud1]}" ]]; then
        bindkey "''${terminfo[kcud1]}" history-substring-search-down
      fi
    '';
  };
}
