{ ... }:
let
  colors = import ./theme/bloop.nix;
in
{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        ### Display ###
        monitor = 0;
        follow = "mouse";
        width = "(300, 900)";
        height = "(50, 600)";
        origin = "top-right";
        offset = "16x16";
        scale = 0;
        notification_limit = 5;

        ### Progress bar ###
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;

        ### Frame ###
        frame_width = 1;
        frame_color = colors.bright.black;
        separator_color = "frame";

        ### Text ###
        font = "Iosevka Custom 10";
        line_height = 2;
        markup = "no";
        format = "<span font=\"Iosevka Custom 12\">%s</span>\\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        word_wrap = "yes";
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;

        ### Icons ###
        enable_recursive_icon_lookup = true;
        icon_position = "right";
        icon_corner_radius = 0;
        max_icon_size = 40;
        corner_radius = 0;

        ### History ###
        sticky_history = true;
        history_length = 20;

        ### Mouse ###
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };

      urgency_low = {
        background = colors.secondary.background;
        foreground = colors.secondary.foreground;
        timeout = 10;
      };

      urgency_normal = {
        background = colors.secondary.background;
        foreground = colors.secondary.foreground;
        timeout = 10;
      };

      urgency_critical = {
        background = colors.primary.background;
        foreground = colors.normal.red;
        frame_color = colors.bright.red;
        timeout = 0;
      };
    };
  };
}
