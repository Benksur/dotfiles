-- Flare — ported from the Flare VSCode theme (warm dark, amber/orange accents).
local M = {}

M.base_30 = {
  white = "#e0e0e0",
  darker_black = "#171717",
  black = "#1f1f1f", -- nvim bg
  black2 = "#242424",
  one_bg = "#262626",
  one_bg2 = "#2a2a2a",
  one_bg3 = "#303030",
  grey = "#3c3c3c",
  grey_fg = "#5f5f5f",
  grey_fg2 = "#727272",
  light_grey = "#7f7b66",
  red = "#F85931",
  baby_pink = "#ea603e",
  pink = "#EBA96C",
  line = "#2a2a2a",
  green = "#A6E22E",
  vibrant_green = "#A6E22E",
  nord_blue = "#EBA96C",
  blue = "#798283",
  yellow = "#FFC62F",
  sun = "#FFC62F",
  purple = "#DB9833",
  dark_purple = "#DB9833",
  teal = "#798283",
  orange = "#ea603e",
  cyan = "#FF8F2E",
  statusline_bg = "#1a1a1a",
  lightbg = "#2a2a2a",
  pmenu_bg = "#ea603e",
  folder_bg = "#FF8F2E",
}

M.base_16 = {
  base00 = "#1f1f1f", -- background
  base01 = "#242424",
  base02 = "#303030",
  base03 = "#5f5f5f", -- comments
  base04 = "#727272",
  base05 = "#bcac8f", -- default fg
  base06 = "#d4c5a8",
  base07 = "#e0e0e0",
  base08 = "#ea603e", -- keywords / variables
  base09 = "#DB9833", -- numbers / constants
  base0A = "#FFC62F", -- storage / types
  base0B = "#cc7f66", -- strings
  base0C = "#FF8F2E", -- support / operators
  base0D = "#FFC62F", -- functions
  base0E = "#ea603e", -- keywords
  base0F = "#EBA96C",
}

M.polish_hl = {
  defaults = {
    Comment = { fg = M.base_30.grey_fg, italic = true },
    CursorLine = { bg = M.base_30.one_bg2 },
    LineNr = { fg = M.base_30.grey_fg },
    CursorLineNr = { fg = M.base_30.sun, bold = true },
  },
  treesitter = {
    ["@comment"] = { fg = M.base_30.grey_fg, italic = true },
    ["@keyword"] = { fg = M.base_30.orange },
    ["@keyword.function"] = { fg = M.base_30.orange },
    ["@keyword.operator"] = { fg = M.base_30.cyan },
    ["@type"] = { fg = M.base_30.yellow },
    ["@type.builtin"] = { fg = M.base_30.yellow },
    ["@function"] = { fg = M.base_30.sun },
    ["@function.builtin"] = { fg = M.base_30.cyan },
    ["@function.method"] = { fg = M.base_30.sun },
    ["@string"] = { fg = "#cc7f66" },
    ["@number"] = { fg = M.base_30.purple },
    ["@constant"] = { fg = M.base_30.purple },
    ["@constant.builtin"] = { fg = M.base_30.purple },
    ["@variable"] = { fg = M.base_30.white },
    ["@variable.parameter"] = { fg = M.base_30.pink },
    ["@variable.member"] = { fg = M.base_30.light_grey },
    ["@operator"] = { fg = M.base_30.cyan },
    ["@punctuation.bracket"] = { fg = M.base_30.light_grey },
    ["@punctuation.delimiter"] = { fg = M.base_30.light_grey },
    ["@tag"] = { fg = M.base_30.yellow },
    ["@tag.attribute"] = { fg = M.base_30.blue },
    ["@attribute"] = { fg = M.base_30.blue },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "flare")

return M
