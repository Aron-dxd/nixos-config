{ ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f";
    fileWidget.command = "fd --type f";
    historyWidget.command = "";
  };
}
