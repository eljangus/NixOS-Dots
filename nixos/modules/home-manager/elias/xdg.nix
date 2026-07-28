{ ... }:

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/jpeg" = "imv.desktop";
      "image/png" = "imv.desktop";
      "image/gif" = "firefox.desktop";
      "image/webp" = "imv.desktop";
      "image/heif" = "imv.desktop";
      "text/plain" = "codium.desktop";
      "text/css" = "codium.desktop";
      "application/x-shellscript" = "codium.desktop";
      "application/x-zerosize" = "codium.desktop";
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "application/pdf" = "firefox.desktop";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "chromium.desktop";
      "audio/mpeg" = "org.gnome.Decibels.desktop";
      "inode/directory" = "org.gnome.Nautilus.desktop";
      "video/mp4" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/ogg" = "mpv.desktop";
      "video/quicktime" = "mpv.desktop";
      "video/x-flv" = "mpv.desktop";
      "video/x-msvideo" = "mpv.desktop";
      "video/x-ms-wmv" = "mpv.desktop";
      "video/mpeg" = "mpv.desktop";
      "text/x-chdr" = "codium.desktop";
      "text/x-csrc" = "codium.desktop";
      "text/x-c++hdr" = "codium.desktop";
      "text/x-c++src" = "codium.desktop";
    };
  };
}
