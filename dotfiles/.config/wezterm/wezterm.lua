local wezterm = require("wezterm")
local config = {
  font = wezterm.font('JetBrains Mono', { weight = "Regular", stretch = "Normal", style = "Normal" }),
  font_size = 16.0,
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  audible_bell = "Disabled",
  check_for_updates = false,
  launch_menu = {},

  leader = { key = "m", mods = "CTRL", timeout_miliseconds = 2000 },
  disable_default_key_bindings = true,

  -- color_scheme = "Builtin Solarized Dark",
  colors = {
    foreground = "#CBE0F0",
    background = "#011423",
    cursor_bg = "#47FF9C",
    cursor_border = "#47FF9C",
    cursor_fg = "#011423",
    selection_bg = "#033259",
    selection_fg = "#CBE0F0",
    ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
    brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
  },

  inactive_pane_hsb = {
    hue = 1.0,
    saturation = 1.0,
    brightness = 1.0,
  },

  enable_tab_bar = false,

  window_decorations = "RESIZE",
  window_background_opacity = 0.75,
  text_background_opacity = 1.0,
  macos_window_background_blur = 10,

  keys = {
    -- Send "CTRL-ALT" to the terminal when pressing CTRL-ALT, CTRL-ALT
    { key = "a", mods = "LEADER|CTRL",  action = wezterm.action { SendString = "\x01" } },
    { key = "v", mods = "LEADER",       action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    { key = "|", mods = "LEADER",       action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    { key = "z", mods = "LEADER",       action = "TogglePaneZoomState" },
    { key = "c", mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
    { key = "h", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
    { key = "j", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
    { key = "k", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
    { key = "l", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
    { key = "H", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
    { key = "J", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
    { key = "K", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
    { key = "L", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
    { key = "1", mods = "LEADER",       action = wezterm.action { ActivateTab = 0 } },
    { key = "2", mods = "LEADER",       action = wezterm.action { ActivateTab = 1 } },
    { key = "3", mods = "LEADER",       action = wezterm.action { ActivateTab = 2 } },
    { key = "4", mods = "LEADER",       action = wezterm.action { ActivateTab = 3 } },
    { key = "5", mods = "LEADER",       action = wezterm.action { ActivateTab = 4 } },
    { key = "6", mods = "LEADER",       action = wezterm.action { ActivateTab = 5 } },
    { key = "7", mods = "LEADER",       action = wezterm.action { ActivateTab = 6 } },
    { key = "8", mods = "LEADER",       action = wezterm.action { ActivateTab = 7 } },
    { key = "9", mods = "LEADER",       action = wezterm.action { ActivateTab = 8 } },
    { key = "&", mods = "LEADER|SHIFT", action = wezterm.action { CloseCurrentTab = { confirm = true } } },
    { key = "x", mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = true } } },

    { key = "n", mods = "LEADER",       action = "ToggleFullScreen" },
    { key = "v", mods = "SHIFT|CTRL",       action = wezterm.action.PasteFrom 'Clipboard' },
    { key = "c", mods = "SHIFT|CTRL",   action = wezterm.action.CopyTo 'Clipboard' },
    { key = "+", mods = "LEADER",       action = "IncreaseFontSize" },
    { key = "-", mods = "LEADER",       action = "DecreaseFontSize" },
    { key = "0", mods = "LEADER",       action = "ResetFontSize" },
  },
  set_environment_variables = {},
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  -- config.front_end = "Software" -- OpenGL doesn't work quite well with RDP.
  -- config.term = "" -- Set to empty so FZF works on windows
  table.insert(config.launch_menu, { label = "PowerShell", args = { "powershell.exe", "-NoLogo" } })

  -- Find installed visual studio version(s) and add their compilation
  -- environment command prompts to the menu
  for _, vsvers in ipairs(wezterm.glob("Microsoft Visual Studio/20*", "C:/Program Files (x86)")) do
    local year = vsvers:gsub("Microsoft Visual Studio/", "")
    table.insert(config.launch_menu, {
      label = "x64 Native Tools VS " .. year,
      args = { "cmd.exe", "/k", "C:/Program Files (x86)/" .. vsvers .. "/BuildTools/VC/Auxiliary/Build/vcvars64.bat" },
    })
  end
else
  -- config.default_prog = { '/usr/bin/env zsh' }
  config.default_cwd = "~/Documents"
end

return config
