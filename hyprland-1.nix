{ config, pkgs, ... }:
{
	wayland.windowManager.hyprland = {
		enable = true;

		settings = {

			# ── MONITOR ──────────────────────────────────────────────────────────
			monitor = [ ",preferred,auto,1" ];

			# ── STARTUP ──────────────────────────────────────────────────────────
			# noctalia-shell is launched by its HM module; only add things here
			# that are not managed elsewhere.
			exec-once = [
				"noctalia-shell"
			];

			# ── INPUT ────────────────────────────────────────────────────────────
			input = {
				kb_layout = "us";
				follow_mouse = 1;
				touchpad = {
					natural_scroll = true;
					disable_while_typing = true;
					tap-to-click = true;
				};
				sensitivity = 0;
			};

			# ── GENERAL ──────────────────────────────────────────────────────────
			general = {
				gaps_in = 4;
				gaps_out = 8;
				border_size = 2;
				"col.active_border" = "rgba(88c0d0ff) rgba(81a1c1ff) 45deg";
				"col.inactive_border" = "rgba(2e3440aa)";
				layout = "master";
				resize_on_border = true;
			};

			# ── DECORATION ───────────────────────────────────────────────────────
			decoration = {
				rounding = 8;
				active_opacity = 1.0;
				inactive_opacity = 0.95;

				blur = {
					enabled = true;
					size = 4;
					passes = 2;
					new_optimizations = true;
					ignore_opacity = false;
				};

				shadow = {
					enabled = true;
					range = 12;
					render_power = 2;
					color = "rgba(0,0,0,0.4)";
				};
			};

			# ── ANIMATIONS ───────────────────────────────────────────────────────
			# Minimal: fast slide+fade on windows, subtle slidefade on workspaces.
			# Nothing bouncy. All durations ≤ 250ms.
			animations = {
				enabled = true;

				bezier = [
					"snap,    0.25, 1.0,  0.5,  1.0"   # fast ease-out, no overshoot
					"ease,    0.4,  0.0,  0.2,  1.0"   # material standard
				];

				animation = [
					"windows,     1, 2,   snap,  slide"
					"windowsOut,  1, 2,   snap,  slide"
					"windowsMove, 1, 2,   snap"
					"fade,        1, 3,   ease"
					"fadeOut,     1, 3,   ease"
					"workspaces,  1, 3,   ease,  slidefade 20%"
					"layers,      1, 2,   ease,  fade"
					"layersOut,   1, 2,   ease,  fade"
				];
			};

			# ── LAYOUT: MASTER ───────────────────────────────────────────────────
			# One dominant window left, stack of secondaries right.
			# Ideal for vim-left, browser/terminal-right workflows.
			master = {
				new_status = "slave";
				new_on_top = false;
				mfact = 0.55;
			};

			# ── MISC ─────────────────────────────────────────────────────────────
			misc = {
				force_default_wallpaper = 0;
				disable_hyprland_logo = true;
				disable_splash_rendering = true;
				# Allow noctalia bar layer to receive input (for click events)
				layers_hog_keyboard_focus = false;
			};

			# ── WINDOW RULES ─────────────────────────────────────────────────────
			windowrule = [
			];

			# layerrules are in extraConfig below — HM serializer mangles
			# namespace strings containing hyphens when inside settings attrset.

			# ── VARIABLES ────────────────────────────────────────────────────────
			"$mod" = "SUPER";
			"$scriptsDir" = "$HOME/.config/hypr/scripts";

			# ── KEYBINDS ─────────────────────────────────────────────────────────
			# Vim-remapped JaKooLit binds.
			# h/j/k/l  = focus movement (was arrow keys)
			# H/J/K/L  = move window     (SUPER CTRL + vim)
			# Resize stays on arrow keys (muscle memory is fine for resize)
			# Swap on SUPER ALT + vim keys

			bind = [
				# Session
				"CTRL ALT, Delete,  exec, hyprctl dispatch exit 0"
				"$mod, Q,           killactive,"

				# Apps
				"$mod, Return,      exec, kitty"
				"$mod, B,           exec, zen"

				# Master layout — j/k cycle (already vim-flavoured in JaKooLit)
				"$mod CTRL, D,      layoutmsg, removemaster"
				"$mod, I,           layoutmsg, addmaster"
				"$mod, j,           layoutmsg, cyclenext"
				"$mod, k,           layoutmsg, cycleprev"
				"$mod CTRL, Return, layoutmsg, swapwithmaster"

				# Dwindle
				"$mod, v,           togglesplit"   # was SHIFT+I; v = vertical split (vim sense)
				"$mod, P,           pseudo,"

				# Split ratio nudge
				"$mod, m,           exec, hyprctl dispatch splitratio 0.3"

				# Groups
				"$mod, G,           togglegroup"
				"$mod CTRL, Tab,    changegroupactive"

				# Float cycling
				"ALT, Tab,          cyclenext,"
				"ALT, Tab,          bringactivetotop,"

				# Focus — vim home row
				"$mod, h,           movefocus, l"
				"$mod, l,           movefocus, r"
				"$mod, k,           movefocus, u"
				"$mod, j,           movefocus, d"

				# Move window — vim home row
				"$mod CTRL, h,      movewindow, l"
				"$mod CTRL, l,      movewindow, r"
				"$mod CTRL, k,      movewindow, u"
				"$mod CTRL, j,      movewindow, d"

				# Swap window — vim home row
				"$mod ALT, h,       swapwindow, l"
				"$mod ALT, l,       swapwindow, r"
				"$mod ALT, k,       swapwindow, u"
				"$mod ALT, j,       swapwindow, d"

				# Workspace cycling
				"$mod, Tab,         workspace, m+1"
				"$mod SHIFT, Tab,   workspace, m-1"

				# Special workspace (scratchpad)
				"$mod SHIFT, U,     movetoworkspace, special"
				"$mod, U,           togglespecialworkspace,"

				# Switch workspaces
				"$mod, code:10,     workspace, 1"
				"$mod, code:11,     workspace, 2"
				"$mod, code:12,     workspace, 3"
				"$mod, code:13,     workspace, 4"
				"$mod, code:14,     workspace, 5"
				"$mod, code:15,     workspace, 6"
				"$mod, code:16,     workspace, 7"
				"$mod, code:17,     workspace, 8"
				"$mod, code:18,     workspace, 9"
				"$mod, code:19,     workspace, 10"

				# Move to workspace (follow)
				"$mod SHIFT, code:10,   movetoworkspace, 1"
				"$mod SHIFT, code:11,   movetoworkspace, 2"
				"$mod SHIFT, code:12,   movetoworkspace, 3"
				"$mod SHIFT, code:13,   movetoworkspace, 4"
				"$mod SHIFT, code:14,   movetoworkspace, 5"
				"$mod SHIFT, code:15,   movetoworkspace, 6"
				"$mod SHIFT, code:16,   movetoworkspace, 7"
				"$mod SHIFT, code:17,   movetoworkspace, 8"
				"$mod SHIFT, code:18,   movetoworkspace, 9"
				"$mod SHIFT, code:19,   movetoworkspace, 10"
				"$mod SHIFT, bracketleft,  movetoworkspace, -1"
				"$mod SHIFT, bracketright, movetoworkspace, +1"

				# Move to workspace (silent)
				"$mod CTRL, code:10,   movetoworkspacesilent, 1"
				"$mod CTRL, code:11,   movetoworkspacesilent, 2"
				"$mod CTRL, code:12,   movetoworkspacesilent, 3"
				"$mod CTRL, code:13,   movetoworkspacesilent, 4"
				"$mod CTRL, code:14,   movetoworkspacesilent, 5"
				"$mod CTRL, code:15,   movetoworkspacesilent, 6"
				"$mod CTRL, code:16,   movetoworkspacesilent, 7"
				"$mod CTRL, code:17,   movetoworkspacesilent, 8"
				"$mod CTRL, code:18,   movetoworkspacesilent, 9"
				"$mod CTRL, code:19,   movetoworkspacesilent, 10"
				"$mod CTRL, bracketleft,  movetoworkspacesilent, -1"
				"$mod CTRL, bracketright, movetoworkspacesilent, +1"

				# Scroll through workspaces
				"$mod, mouse_down,  workspace, e+1"
				"$mod, mouse_up,    workspace, e-1"
				"$mod, period,      workspace, e+1"
				"$mod, comma,       workspace, e-1"

				# Screenshots
				"$mod, Print,               exec, $scriptsDir/ScreenShot.sh --now"
				"$mod SHIFT, Print,         exec, $scriptsDir/ScreenShot.sh --area"
				"$mod CTRL, Print,          exec, $scriptsDir/ScreenShot.sh --in5"
				"$mod CTRL SHIFT, Print,    exec, $scriptsDir/ScreenShot.sh --in10"
				"ALT, Print,                exec, $scriptsDir/ScreenShot.sh --active"
				"$mod SHIFT, S,             exec, $scriptsDir/ScreenShot.sh --swappy"
			];

			# Repeatable binds (held key)
			binde = [
				"$mod SHIFT, left,  resizeactive, -50 0"
				"$mod SHIFT, right, resizeactive, 50 0"
				"$mod SHIFT, up,    resizeactive, 0 -50"
				"$mod SHIFT, down,  resizeactive, 0 50"
			];

			# Non-repeat binds (media / power keys)
			bindl = [
				", xf86Sleep,           exec, systemctl suspend"
				", xf86Rfkill,          exec, $scriptsDir/AirplaneMode.sh"
				", xf86AudioMicMute,    exec, $scriptsDir/Volume.sh --toggle-mic"
				", xf86audiomute,       exec, $scriptsDir/Volume.sh --toggle"
				", xf86AudioPlayPause,  exec, $scriptsDir/MediaCtrl.sh --pause"
				", xf86AudioPause,      exec, $scriptsDir/MediaCtrl.sh --pause"
				", xf86AudioPlay,       exec, $scriptsDir/MediaCtrl.sh --pause"
				", xf86AudioNext,       exec, $scriptsDir/MediaCtrl.sh --nxt"
				", xf86AudioPrev,       exec, $scriptsDir/MediaCtrl.sh --prv"
				", xf86audiostop,       exec, $scriptsDir/MediaCtrl.sh --stop"
			];

			# Repeatable + non-repeat (volume keys need both)
			bindel = [
				", xf86audioraisevolume, exec, $scriptsDir/Volume.sh --inc"
				", xf86audiolowervolume, exec, $scriptsDir/Volume.sh --dec"
			];

			# Mouse binds
			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
			];
		};
	
	};
}
