{ ... }:
{
  programs.keepassxc = {
    enable = true;
    settings = {
      General = {
        ConfigVersion = 2;
        AutoSaveAfterEveryChange = true;
        AutoSaveOnExit = true;
        BackupBeforeSave = true;
        MinimizeOnClose = true;
        MinimizeToTray = true;
        StartMinimized = true;
        RememberLastDatabases = true;
        RememberLastKeyFiles = true;
      };

      Browser = {
        Enabled = true;
        CustomProxyLocation = "";
        SearchInAllDatabases = true;
        SupportBrowserProxy = true;
        UnlockDatabase = true;
        MatchUrlScheme = true;
      };

      GUI = {
        ApplicationTheme = "classic";
        TrayIconAppearance = "monochrome-light";
        ShowTrayIcon = true;
        MinimizeToTray = true;
        HideUsernames = false;
        HidePasswords = true;
        AdvancedSettings = false;
        CompactMode = false;
      };

      Security = {
        ClearClipboardAfter = true;
        ClearClipboardTimeout = 10;
        ClearSearchAfter = true;
        ClearSearchTimeout = 5;
        LockDatabaseIdle = true;
        LockDatabaseIdleSeconds = 240;
        PasswordsHidden = true;
        RelockAutoType = true;
      };

      PasswordGenerator = {
        AdditionalChars = "";
        ExcludedChars = "";
        Length = 30;
        UseUppercase = true;
        UseLowercase = true;
        UseNumbers = true;
        UseSpecialChars = true;
        UseExtendedAscii = false;
      };
    };
  };
}
