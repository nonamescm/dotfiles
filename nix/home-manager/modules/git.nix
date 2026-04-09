{ gitUsername, gitEmail, ... }:
{
  programs.git = {
    enable = true;
    settings.user.name = gitUsername;
    settings.user.email = gitEmail;
  };
}
