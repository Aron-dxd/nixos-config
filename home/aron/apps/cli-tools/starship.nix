{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      directory = {
        truncation_length = 0;
        truncate_to_repo = false;
      };
    };
  };
}
