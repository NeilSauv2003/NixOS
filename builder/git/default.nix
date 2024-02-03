{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;

    userEmail = "USER_EMAIL";
    userName = "USER_MAJ";
    signing = {
      key = "USER_KEY";
      signByDefault = true;
    };

    delta = {
      enable = true;
      options = {
        side-by-side = true;
        dark = true;
      };
    };

    ignores = [ "*~" "*.swp" ".o" ".d" "format_marker"];

    aliases = {
      lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'";
    };

    extraConfig = {
      push.autoSetupRemote = true;
      init.defaultbranch = "master";
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };
}
