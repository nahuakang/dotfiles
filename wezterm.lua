-- Run the following to set up on a new machine
-- $ mkdir ~/.config/wezterm
-- $ ln -s ~/dotfiles/wezterm.lua ~/.config/wezterm/wezterm.lua

local wezterm = require 'wezterm'

return {
    -- color_scheme = "Gruvbox dark, medium (base16)",
    -- color_scheme = "nord",
    color_scheme = "Catppuccin Mocha",

    font = wezterm.font_with_fallback {
        'Comic Code Ligatures',
        'FiraCode Nerd Font',
        'JetBrains Mono',
    },

    initial_cols = 120,
    initial_rows = 40,

    leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
    keys = {
        { key = 'a', mods = 'LEADER|CTRL', action = wezterm.action.SendString '\x01' },
        { key = '|', mods = 'LEADER|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = '-', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
        { key = 'z', mods = 'LEADER', action = "TogglePaneZoomState" },
        { key = "t", mods = "LEADER", action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
        { key = "h", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Left" } },
        { key = "j", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Down" } },
        { key = "k", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Up" } },
        { key = "l", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Right" } },
        { key = "H", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
        { key = "J", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
        { key = "K", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
        { key = "L", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
        { key = "1", mods = "ALT", action = wezterm.action { ActivateTab = 0 } },
        { key = "2", mods = "ALT", action = wezterm.action { ActivateTab = 1 } },
        { key = "3", mods = "ALT", action = wezterm.action { ActivateTab = 2 } },
        { key = "4", mods = "ALT", action = wezterm.action { ActivateTab = 3 } },
        { key = "5", mods = "ALT", action = wezterm.action { ActivateTab = 4 } },
        { key = "6", mods = "ALT", action = wezterm.action { ActivateTab = 5 } },
        { key = "7", mods = "ALT", action = wezterm.action { ActivateTab = 6 } },
        { key = "8", mods = "ALT", action = wezterm.action { ActivateTab = 7 } },
        { key = "9", mods = "ALT", action = wezterm.action { ActivateTab = 8 } },
    },

    enable_scroll_bar = false,
    scrollback_lines = 3500,

    warn_about_missing_glyphs = false,
}
