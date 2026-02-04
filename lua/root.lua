-- ~/.config/nvim/lua/mi_tema.lua

-- 1. Define el nombre de tu colorscheme
vim.g.colors_name = "black"

-- 2. Define tu paleta de colores
local colors = {
  bg = "#202020",
  fg = "#d4d4d4",
  red = "#e06c75",
  green = "#98c379",
  yellow = "#e5c07b",
  blue = "#61afef",
  magenta = "#c678dd",
  cyan = "#56b6c2",
  comment = "#5c6370",
  selection = "#3e4452",
  cursorline = "#3e0000",
}

-- 3. Define los grupos de resaltado
-- Estos son los elementos que Neovim colorea
local highlight_groups = {
  -- Grupos principales
  Normal = { fg = colors.fg, bg = colors.bg },
  Comment = { fg = colors.comment, italic = true },
  LineNr = { fg = colors.comment, bg = colors.bg },
  CursorLine = { bg = colors.cursorline },
  CursorLineNr = { fg = colors.yellow, bg = colors.cursorline },
  Visual = { bg = colors.selection },

  -- Sintaxis
  Keyword = { fg = colors.magenta },
  Function = { fg = colors.blue },
  Identifier = { fg = colors.fg },
  String = { fg = colors.green },
  Number = { fg = colors.yellow },
  Boolean = { fg = colors.yellow },
  Type = { fg = colors.cyan },

  -- UI de Neovim
  Pmenu = { fg = colors.fg, bg = colors.cursorline },
  PmenuSel = { fg = colors.blue, bg = colors.selection },
  StatusLine = { fg = colors.fg, bg = colors.cursorline },
  StatusLineNC = { fg = colors.comment, bg = colors.black },
  MatchParen = { fg = colors.yellow, bold = true, underline = true },
  Search = { fg = colors.bg, bg = colors.yellow },
}

-- 4. Aplica el esquema de colores
vim.o.background = "dark"
vim.o.termguicolors = true

for group, settings in pairs(highlight_groups) do
  vim.api.nvim_set_hl(0, group, settings)
end

