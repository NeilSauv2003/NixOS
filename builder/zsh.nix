{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "754cefe0181a7acd42fdcb357a67d0217291ac47";
          sha256 = "kWgPe7QJljERzcv4bYbHteNJIxCehaTu4xU9r64gUM4=";
        };
      }
    ];

    shellAliases = {
      ll = "ls -l";
      lsa = "ls -lah";
    };

    oh-my-zsh = {
      enable = true;

      custom = "$HOME/extra/zsh";
      theme = "sigma";

      plugins = [
        "git"
      ];
    };

    initExtra = ''
        if [[ ":$PATH:" != *":/nix/store/vd679zh0i8vdixl7d0f65yvsq5nmr50h-home-manager-path/bin:"* ]]; then
            export PATH="/nix/store/vd679zh0i8vdixl7d0f65yvsq5nmr50h-home-manager-path/bin:$PATH"
        fi
        alias srt='~/.dotfiles/tools/utils/gccRunProg.sh'
        alias grep='grep --color -n'
        alias ccat='pygmentize -f terminal -g'
        alias epita='cd ~/EPITA'
        alias tools='cd ~/.dotfiles/tools/utils'
        alias vimpath='cd ~/.dotfiles/tools/vim/.vim/bundle'
        alias nixvim='vim ~/.dotfiles/tools/vim/.vimrc'
        alias cpy='~/.dotfiles/tools/utils/copy.sh'
        alias pst='~/.dotfiles/tools/utils/paste.sh'
        alias xcut='~/.dotfiles/tools/utils/xcut.sh'
        alias rm='~/.dotfiles/tools/utils/rm.sh'
        alias recover='~/.dotfiles/tools/utils/recover.sh'
        alias trashclean='~/.dotfiles/tools/utils/trashclean.sh'
        alias update='~/.dotfiles/apply-user.sh USER_NAME && up'
        alias cleanupdate='~/.dotfiles/apply-user.sh USER_NAME -d && up'
        alias up='source ~/.zshrc'
        alias dwn='cd ~/Downloads'
        alias prg='cd ~/.dotfiles/programs/'
        alias mk='clear; make'
        alias nixsh='vim ~/.dotfiles/builder/zsh.nix'
        alias nixi3='vim ~/.dotfiles/programs/i3/default.nix'
        alias nixhome='vim ~/.dotfiles/builder/home.nix'
        alias val='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes'
        alias setdir='~/.dotfiles/tools/utils/setdir.sh'
        alias ddir='. ~/.dotfiles/tools/utils/ddir.sh'
        alias makeinit='cp ~/.dotfiles/tools/utils/Makefile Makefile'
        alias sf='sqlfluff lint --dialect postgres'

        alias quizlet=google-chrome-stable --app="https://quizlet.com"
        alias moodle=google-chrome-stable --app="https://moodle.epita.fr/"
        alias chatgpt=google-chrome-stable --app="https://chat.openai.com/"
        alias afsinit=~/.dotfiles/tools/afs/install.sh
        alias afs=~/afs

        export CFLAGS='-Wall -Wextra -Wvla -std=c99 -pedantic -Werror -g'
        export FS='-fsanitize=address'

        setxkbmap -option caps:escape
        export PGDATA="$HOME/postgres_data"
        export PGHOST="/tmp"
        export NAME_USER="USER_NAME"

        eval $(keychain --eval --agents gpg,ssh id_ed25519)
        eval $(keychain --eval --agents gpg --quiet 0xB17D0AED463C9DE9)

    '';
  };

  home.file.omz_zsh_theme = {
    source = ./sigma.zsh-theme;
    target = "extra/zsh/themes/sigma.zsh-theme";
  };
}

