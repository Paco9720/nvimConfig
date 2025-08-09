-- Tema de colores personalizado (lua/colorscheme.lua)

local M = {}

M.setup = function()
  -- Limpiar cualquier resaltado existente
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.background = "dark"
  vim.o.termguicolors = true

  local colors = {
    bg = "#000000",        -- Fondo oscuro
    fg = "#abb2bf",        -- Texto principal
    red = "#e06c75",       -- Rojo
    green = "#98c379",     -- Verde
    yellow = "#e5c07b",    -- Amarillo
    blue = "#61afef",      -- Azul
    magenta = "#c678dd",   -- Magenta
    cyan = "#56b6c2",      -- Cian
    orange = "#d19a66",    -- Naranja
    comment = "#5c6370",   -- Comentarios
    selection = "#3e4452", -- Selección
    line_nr = "#5c6370",   -- Números de línea
    cursor_line = "#2c323a", -- Línea del cursor
  }

  -- Configuración de resaltado
  local highlight = vim.api.nvim_set_hl

  highlight(0, "Normal", { fg = colors.fg, bg = colors.bg })
  highlight(0, "Comment", { fg = colors.comment, italic = true })
  highlight(0, "Constant", { fg = colors.orange })
  highlight(0, "String", { fg = colors.green })
  highlight(0, "Character", { fg = colors.green })
  highlight(0, "Number", { fg = colors.orange })
  highlight(0, "Boolean", { fg = colors.orange })
  highlight(0, "Float", { fg = colors.orange })
  highlight(0, "Identifier", { fg = colors.blue })
  highlight(0, "Function", { fg = colors.blue })
  highlight(0, "Statement", { fg = colors.magenta })
  highlight(0, "Conditional", { fg = colors.magenta })
  highlight(0, "Repeat", { fg = colors.magenta })
  highlight(0, "Label", { fg = colors.magenta })
  highlight(0, "Operator", { fg = colors.cyan })
  highlight(0, "Keyword", { fg = colors.magenta })
  highlight(0, "Exception", { fg = colors.magenta })
  highlight(0, "PreProc", { fg = colors.yellow })
  highlight(0, "Include", { fg = colors.yellow })
  highlight(0, "Define", { fg = colors.yellow })
  highlight(0, "Macro", { fg = colors.yellow })
  highlight(0, "PreCondit", { fg = colors.yellow })
  highlight(0, "Type", { fg = colors.yellow })
  highlight(0, "StorageClass", { fg = colors.yellow })
  highlight(0, "Structure", { fg = colors.yellow })
  highlight(0, "Typedef", { fg = colors.yellow })
  highlight(0, "Special", { fg = colors.cyan })
  highlight(0, "SpecialChar", { fg = colors.cyan })
  highlight(0, "Tag", { fg = colors.cyan })
  highlight(0, "Delimiter", { fg = colors.cyan })
  highlight(0, "SpecialComment", { fg = colors.cyan })
  highlight(0, "Debug", { fg = colors.red })
  highlight(0, "Underlined", { underline = true })
  highlight(0, "Error", { fg = colors.red, bold = true })
  highlight(0, "Todo", { fg = colors.magenta, bold = true })

  -- Resaltados específicos de Neovim
  highlight(0, "LineNr", { fg = colors.line_nr })
  highlight(0, "CursorLineNr", { fg = colors.fg, bold = true })
  highlight(0, "CursorLine", { bg = colors.cursor_line })
  highlight(0, "Visual", { bg = colors.selection })
  highlight(0, "Folded", { fg = colors.comment, bg = colors.cursor_line })
  highlight(0, "NonText", { fg = colors.comment })
  highlight(0, "SpecialKey", { fg = colors.comment })
  highlight(0, "Pmenu", { fg = colors.fg, bg = colors.selection })
  highlight(0, "PmenuSel", { fg = colors.bg, bg = colors.blue })
  highlight(0, "PmenuSbar", { bg = colors.comment })
  highlight(0, "PmenuThumb", { bg = colors.fg })
  highlight(0, "MatchParen", { fg = colors.yellow, bold = true })
  highlight(0, "Search", { fg = colors.bg, bg = colors.yellow })
  highlight(0, "IncSearch", { fg = colors.bg, bg = colors.orange })
  highlight(0, "ErrorMsg", { fg = colors.red, bg = colors.bg })
  highlight(0, "WarningMsg", { fg = colors.yellow, bg = colors.bg })
  highlight(0, "InfoMsg", { fg = colors.blue, bg = colors.bg })
  highlight(0, "StatusLine", { fg = colors.fg, bg = colors.selection })
  highlight(0, "StatusLineNC", { fg = colors.comment, bg = colors.cursor_line })
  highlight(0, "VertSplit", { fg = colors.comment, bg = colors.bg })
  highlight(0, "ColorColumn", { bg = colors.cursor_line })
  highlight(0, "SignColumn", { fg = colors.comment, bg = colors.bg })
  highlight(0, "FoldColumn", { fg = colors.comment, bg = colors.bg })

  -- LSP Diagnostics
  highlight(0, "DiagnosticError", { fg = colors.red })
  highlight(0, "DiagnosticWarn", { fg = colors.yellow })
  highlight(0, "DiagnosticInfo", { fg = colors.blue })
  highlight(0, "DiagnosticHint", { fg = colors.cyan })
  highlight(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
  highlight(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
  highlight(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
  highlight(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.cyan })

  -- NvimTree
  highlight(0, "NvimTreeRootFolder", { fg = colors.blue, bold = true })
  highlight(0, "NvimTreeFolderIcon", { fg = colors.blue })
  highlight(0, "NvimTreeFileIcon", { fg = colors.fg })
  highlight(0, "NvimTreeSpecialFile", { fg = colors.orange, underline = true })
  highlight(0, "NvimTreeImageFile", { fg = colors.magenta })
  highlight(0, "NvimTreeExecFile", { fg = colors.green, bold = true })

  -- Lualine
  highlight(0, "LualineA", { fg = colors.bg, bg = colors.blue, bold = true })
  highlight(0, "LualineB", { fg = colors.fg, bg = colors.selection })
  highlight(0, "LualineC", { fg = colors.fg, bg = colors.bg })
  highlight(0, "LualineX", { fg = colors.fg, bg = colors.selection })
  highlight(0, "LualineY", { fg = colors.bg, bg = colors.orange, bold = true })
  highlight(0, "LualineZ", { fg = colors.bg, bg = colors.blue, bold = true })
  highlight(0, "LualineInactiveA", { fg = colors.comment, bg = colors.cursor_line })
  highlight(0, "LualineInactiveB", { fg = colors.comment, bg = colors.cursor_line })
  highlight(0, "LualineInactiveC", { fg = colors.comment, bg = colors.cursor_line })

  -- Cmp (autocompletado)
  highlight(0, "CmpItemAbbr", { fg = colors.fg })
  highlight(0, "CmpItemAbbrMatch", { fg = colors.blue, bold = true })
  highlight(0, "CmpItemKind", { fg = colors.magenta })
  highlight(0, "CmpItemMenu", { fg = colors.comment })

  -- Telescope
  highlight(0, "TelescopeBorder", { fg = colors.comment })
  highlight(0, "TelescopePromptNormal", { fg = colors.fg, bg = colors.selection })
  highlight(0, "TelescopePromptBorder", { fg = colors.selection, bg = colors.selection })
  highlight(0, "TelescopePromptTitle", { fg = colors.bg, bg = colors.blue })
  highlight(0, "TelescopeResultsNormal", { fg = colors.fg, bg = colors.bg })
  highlight(0, "TelescopeResultsBorder", { fg = colors.bg, bg = colors.bg })
  highlight(0, "TelescopeResultsTitle", { fg = colors.bg, bg = colors.bg })
  highlight(0, "TelescopePreviewNormal", { fg = colors.fg, bg = colors.cursor_line })
  highlight(0, "TelescopePreviewBorder", { fg = colors.cursor_line, bg = colors.cursor_line })
  highlight(0, "TelescopePreviewTitle", { fg = colors.bg, bg = colors.cursor_line })
  highlight(0, "TelescopeMatching", { fg = colors.blue, bold = true })
end

return M
