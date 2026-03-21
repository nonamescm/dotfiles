{ config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    history = {
      size = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
      ignoreDups = true;
      share = true;
    };

    autocd = true;
    defaultKeymap = "emacs";

    initExtra = ''
      setopt no_nomatch prompt_subst interactivecomments
      fpath+=~/.zfunc

      autoload -Uz colors && colors
      autoload -U history-search-end
      autoload -U add-zsh-hook

      zle -N history-beginning-search-backward-end history-search-end
      zle -N history-beginning-search-forward-end history-search-end
      zmodload zsh/terminfo
      [[ -n "$terminfo[kcuu1]" ]] && bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
      [[ -n "$terminfo[kcud1]" ]] && bindkey "$terminfo[kcud1]" history-beginning-search-forward-end
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word

      __initialize_git_prompt() {
        local branch=$(git branch --show-current 2>/dev/null)
        if [[ -z "$branch" ]]; then
          __GIT_PROMPT=""
          return
        fi

        local status_out=$(git status --porcelain=v1 2>/dev/null)
        local untracked=$(echo "$status_out" | grep -c "^??")
        local modified=$(echo "$status_out" | grep -c "^ [MD]")
        local staged=$(echo "$status_out" | grep -c "^[AMD]")

        local git_info=" %F{red}git:%f(%F{green}$branch%f"
        
        (( untracked + modified > 0 )) && git_info+=" %F{blue}*$(($untracked + $modified))%f"
        (( staged > 0 )) && git_info+=" %F{yellow}+$staged%f"
        
        __GIT_PROMPT="$git_info)"
      }

      _my_prompt_precmd() {
        local last_status=$?
        if [[ $last_status -eq 0 ]]; then
          STATUS_COLOR="%F{green}"
        else
          STATUS_COLOR="%F{red}"
        fi
        
        __initialize_git_prompt
        printf "\033[6 q"
      }

      add-zsh-hook precmd _my_prompt_precmd

      PROMPT='%F{blue}%c''${__GIT_PROMPT}%f''${STATUS_COLOR} %% %f'

      zstyle ':completion:*' auto-description 'specify: %d'
      zstyle ':completion:*' completer _expand _complete _correct _approximate
      zstyle ':completion:*' format 'Completing %d'
      zstyle ':completion:*' group-name ""
      zstyle ':completion:*:default' list-colors ''${(s.:.)LS_COLORS}
      zstyle ':completion:*' list-colors ""
      zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
      zstyle ':completion:*' matcher-list "" 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
      zstyle ':completion:*' menu select=long
      zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
      zstyle ':completion:*' use-compctl false
      zstyle ':completion:*' verbose true
      zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
      zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
    '';

    shellAliases = {
      sudo = "sudo ";
      doas = "sudo ";
      vim = "nvim";
      vi = "nvim";
      cl = "clear";
      ls = "ls --color=auto";
      l = "ls -lAh";
      la = "ls -lah";
      ll = "ls -lh";
      lq = "ls -A --quoting-style=shell-always";
      rm = "rm -i";
      mv = "mv -i";
      cp = "cp -i";
      ":q" = "exit";
    };
  };
}
