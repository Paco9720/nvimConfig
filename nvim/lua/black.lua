-- lua/theme.lua

local M = {} -- La tabla que se devolverá como módulo

M.setup = function()
    -- Limpia cualquier resaltado previo para evitar conflictos
    vim.cmd("hi clear")

    -- Asegúrate de que los colores verdaderos estén habilitados en tu terminal
    -- Esto es CRUCIAL para que los colores hexadecimales funcionen
    vim.opt.termguicolors = true

    -- Define el fondo del editor como oscuro
    vim.opt.background = 'dark'

    -- Define tu paleta de colores personalizada para un fondo negro
    local colors = {
        background = "#000000",      -- ¡Negro puro para el fondo principal!
        background_light = "#1E1E1E", -- Un gris muy oscuro para elementos como CursorLine
        foreground = "#E0E0E0",     -- Un gris claro para el texto principal
        comment = "#888888",        -- Gris medio para los comentarios
        red = "#FF6B6B",            -- Rojo vivo
        green = "#6BFF6B",          -- Verde brillante
        blue = "#6BA8FF",           -- Azul eléctrico
        yellow = "#FFFF6B",         -- Amarillo brillante
        orange = "#FFA500",          -- Naranja vibrante
        magenta = "#FF6BFF",        -- Magenta brillante
        cyan = "#6BFFFF",           -- Cian brillante
        purple = "#BF6BFF",         -- Púrpura intenso
        light_gray = "#555555",     -- Gris oscuro para separadores, líneas de número inactivas
        selection_bg = "#333333",   -- Fondo para selecciones visuales
    }

    -- Función auxiliar para aplicar grupos de resaltado
    local function highlight(group, fg, bg, style)
        local cmd = "hi " .. group
        if fg then cmd = cmd .. " guifg=" .. fg end
        if bg then cmd = cmd .. " guibg=" .. bg end
        if style then cmd = cmd .. " gui=" .. style end
        vim.cmd(cmd)
    end

    -- ***** GRUPOS DE RESALTADO BÁSICOS DEL EDITOR *****
    highlight("Normal", colors.foreground, colors.background, nil)
    highlight("NonText", colors.light_gray, nil, nil) -- Caracteres de relleno de ventana
    highlight("EndOfBuffer", colors.background, nil, nil) -- Parte inferior del buffer

    highlight("LineNr", colors.light_gray, nil, nil)          -- Números de línea
    highlight("CursorLine", nil, colors.background_light, nil) -- Línea donde está el cursor
    highlight("CursorLineNr", colors.yellow, colors.background_light, "bold") -- Número de línea donde está el cursor
    highlight("Visual", nil, colors.selection_bg, nil)                 -- Selección visual
    highlight("Search", colors.background, colors.yellow, nil)         -- Resultados de búsqueda
    highlight("IncSearch", colors.background, colors.orange, nil)      -- Búsqueda incremental

    -- ***** GRUPOS PARA INTERFAZ DE USUARIO (UI) *****
    highlight("StatusLine", colors.foreground, colors.background_light, "bold")         -- Barra de estado activa
    highlight("StatusLineNC", colors.comment, colors.background, nil)             -- Barra de estado inactiva
    highlight("VertSplit", colors.light_gray, colors.background, nil)            -- Separador de ventanas verticales
    highlight("Pmenu", colors.foreground, colors.background_light, nil)               -- Menú de autocompletado (popup menu)
    highlight("PmenuSel", colors.background, colors.blue, nil)                  -- Selección en menú de autocompletado
    highlight("FoldColumn", colors.cyan, colors.background, nil)                  -- Columna de pliegues (folds)
    highlight("SignColumn", colors.cyan, colors.background, nil)                  -- Columna de signos (diagnósticos, git)
    highlight("ColorColumn", nil, colors.background_light, nil)                                      -- Columna de color (para límite de línea)
    highlight("MatchParen", colors.orange, nil, "bold,underline")                      -- Paréntesis/corchetes/llaves coincidentes

    -- ***** GRUPOS DE RESALTADO DE SINTAXIS (EJEMPLOS COMUNES) *****
    highlight("Comment", colors.comment, nil, "italic")                              -- Comentarios
    highlight("Keyword", colors.magenta, nil, "bold")                                -- Palabras clave (ej. `local`, `function`)
    highlight("Statement", colors.magenta, nil, "bold")                              -- Sentencias de control (ej. `if`, `for`, `while`)
    highlight("Function", colors.green, nil, nil)                                    -- Nombres de funciones
    highlight("String", colors.yellow, nil, nil)                                     -- Cadenas de texto
    highlight("Number", colors.purple, nil, nil)                                     -- Números
    highlight("Boolean", colors.orange, nil, nil)                                    -- Booleanos (true, false)
    highlight("Type", colors.cyan, nil, nil)                                         -- Tipos (ej. `string`, `number`, `boolean`)
    highlight("Variable", colors.foreground, nil, nil)                               -- Nombres de variables
    highlight("Constant", colors.orange, nil, nil)                                   -- Constantes (ej. `nil`, `_G`)
    highlight("Operator", colors.blue, nil, nil)                                     -- Operadores (ej. `+`, `-`, `=`, `==`)
    highlight("Identifier", colors.cyan, nil, nil)                                   -- Identificadores (nombres de variables, funciones, etc. si no son de otro grupo)
    highlight("PreProc", colors.orange, nil, nil)                                    -- Preprocesadores (ej. `#include` en C)
    highlight("Special", colors.blue, nil, nil)                                      -- Caracteres especiales (ej. `%s` en cadenas)
    highlight("Label", colors.yellow, nil, nil)                                      -- Etiquetas (ej. `goto label:`)

    -- ***** GRUPOS ESPECÍFICOS DE LSP (Language Server Protocol) *****
    highlight("DiagnosticError", colors.red, nil, "bold")
    highlight("DiagnosticWarn", colors.yellow, nil, "bold")
    highlight("DiagnosticInfo", colors.blue, nil, "bold")
    highlight("DiagnosticHint", colors.cyan, nil, "bold")

    -- LSP virtual text (diagnósticos inline)
    highlight("LspDiagnosticsVirtualTextError", colors.red, colors.background_light, nil)
    highlight("LspDiagnosticsVirtualTextWarning", colors.yellow, colors.background_light, nil)
    highlight("LspDiagnosticsVirtualTextInfo", colors.blue, colors.background_light, nil)
    highlight("LspDiagnosticsVirtualTextHint", colors.cyan, colors.background_light, nil)

    -- ***** GRUPOS COMUNES DE PLUGINS (ejemplos) *****
    -- nvim-tree
    highlight("NvimTreeRootFolder", colors.orange, nil, "bold")
    highlight("NvimTreeFolderIcon", colors.blue, nil, nil)
    highlight("NvimTreeFileName", colors.foreground, nil, nil)
    highlight("NvimTreeFileIcon", colors.cyan, nil, nil)
    highlight("NvimTreeIndentMarker", colors.comment, nil, nil)

    -- Git signs (si usas `gitsigns.nvim`)
    highlight("GitSignsAdd", colors.green, nil, nil)
    highlight("GitSignsChange", colors.yellow, nil, nil)
    highlight("GitSignsDelete", colors.red, nil, nil)

    -- Telescope (si usas `telescope.nvim`)
    highlight("TelescopePromptNormal", colors.foreground, colors.background_light, nil)
    highlight("TelescopePromptBorder", colors.blue, colors.background_light, nil)
    highlight("TelescopeResultsNormal", colors.foreground, colors.background, nil)
    highlight("TelescopeSelection", colors.background, colors.blue, nil)
    highlight("TelescopeMatching", colors.orange, nil, "bold")

    -- Lualine (si usas `lualine.nvim` para la barra de estado)
    highlight("LualineNormal", colors.foreground, colors.background_light, nil)
    highlight("LualineInsert", colors.background, colors.green, nil)
    highlight("LualineVisual", colors.background, colors.purple, nil)
    highlight("LualineReplace", colors.background, colors.red, nil)
    highlight("LualineCommand", colors.background, colors.blue, nil)

    -- Diagnostics (si usas `vim.diagnostic.show_lines`)
    highlight("DiagnosticUnderlineError", nil, nil, "undercurl")
    highlight("DiagnosticUnderlineWarn", nil, nil, "undercurl")
    highlight("DiagnosticUnderlineInfo", nil, nil, "undercurl")
    highlight("DiagnosticUnderlineHint", nil, nil, "undercurl")
end

return M
