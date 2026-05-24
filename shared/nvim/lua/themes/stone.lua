-- Stone — matches Ghostty / simple-bar Stone, higher-contrast syntax.
local M = {}

M.base_30 = {
  white = "#f8f9fb",
  darker_black = "#050505",
  black = "#0a0a0a", -- nvim bg
  black2 = "#0c0d10",
  one_bg = "#141414",
  one_bg2 = "#1c1e24",
  one_bg3 = "#252830",
  grey = "#484848",
  grey_fg = "#787f8c",
  grey_fg2 = "#a0a8b4",
  light_grey = "#c0c6d0",
  red = "#e090a0",
  baby_pink = "#e8a8b4",
  pink = "#b0acd8",
  line = "#141414",
  green = "#8ebdb4",
  vibrant_green = "#a8d4c8",
  nord_blue = "#92b8f0",
  blue = "#82aee8",
  yellow = "#ddd4a8",
  sun = "#eceef2",
  purple = "#b0acd8",
  dark_purple = "#9894c4",
  teal = "#82c0d0",
  orange = "#e0b090",
  cyan = "#82c0d0",
  statusline_bg = "#0a0a0a",
  lightbg = "#141414",
  pmenu_bg = "#82aee8",
  folder_bg = "#82c0d0",
}

M.base_16 = {
  base00 = "#0a0a0a",
  base01 = "#141414",
  base02 = "#252830",
  base03 = "#484848",
  base04 = "#787f8c",
  base05 = "#d8dce4",
  base06 = "#eceef2",
  base07 = "#f8f9fb",
  base08 = "#e090a0",
  base09 = "#e0b090",
  base0A = "#ddd4a8",
  base0B = "#8ebdb4",
  base0C = "#82c0d0",
  base0D = "#82aee8",
  base0E = "#e890a8",
  base0F = "#e89098",
}

M.polish_hl = {
  defaults = {
    Comment = { fg = M.base_30.grey_fg, italic = true },
    CursorLine = { bg = M.base_30.one_bg2 },
    LineNr = { fg = M.base_30.grey },
    CursorLineNr = { fg = M.base_30.sun, bold = true },
  },
  treesitter = {
    ["@comment"] = { fg = M.base_30.grey_fg, italic = true },
    ["@keyword"] = { fg = M.base_30.red, bold = true },
    ["@keyword.function"] = { fg = M.base_30.blue },
    ["@keyword.operator"] = { fg = M.base_30.light_grey },
    ["@type"] = { fg = M.base_30.cyan },
    ["@type.builtin"] = { fg = M.base_30.teal },
    ["@function"] = { fg = M.base_30.blue },
    ["@function.builtin"] = { fg = M.base_30.purple },
    ["@function.method"] = { fg = M.base_30.nord_blue },
    ["@string"] = { fg = M.base_30.green },
    ["@number"] = { fg = M.base_30.orange },
    ["@constant"] = { fg = M.base_30.orange },
    ["@constant.builtin"] = { fg = M.base_30.red },
    ["@variable"] = { fg = M.base_30.sun },
    ["@variable.parameter"] = { fg = M.base_30.white },
    ["@variable.member"] = { fg = M.base_30.white },
    ["@operator"] = { fg = M.base_30.light_grey },
    ["@punctuation.bracket"] = { fg = M.base_30.grey_fg2 },
    ["@punctuation.delimiter"] = { fg = M.base_30.grey_fg2 },
    ["@tag"] = { fg = M.base_30.red },
    ["@attribute"] = { fg = M.base_30.yellow },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "stone")

return M
