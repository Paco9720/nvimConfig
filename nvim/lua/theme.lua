-- lua/graymist/init.lua

local M = {} -- La tabla que se devolverá como módulo

M.setup = function()
    -- Limpia cualquier resaltado previo para evitar conflictos
    vim.cmd("hi clear")

    -- Asegúrate de que los colores verdaderos estén habilitados en tu terminal
    -- Esto es CRUCIAL para que los colores hexadecimales funcionen
    vim.opt.termguicolors = true

    -- Define el fondo del editor. 'dark' o 'light' ajusta el comportamiento de algunos plugins.
    -- Aquí usamos 'dark' porque nuestro gris es relativamente oscuro, aunque no negro.
    vim.opt.background = 'dark'

    -- Define tu paleta de colores personalizada
    -- Los colores están nombrados descriptivamente para facilitar su uso
    local colors = {
        background_dark = "#2C2F36", -- Un gris oscuro para el fondo principal
        background_light = "#3A3F4B", -- Un gris ligeramente más claro para elementos como CursorLine
        foreground = "#D8DEE9",     -- Un gris azulado claro para el texto principal
        comment = "#7C818C",        -- Un gris medio para los comentarios
        red = "#EB6E81",            -- Rojo suave
        green = "#A7CC8C",          -- Verde claro
        blue = "#8FABDA",           -- Azul suave
        yellow = "#EBCB8B",         -- Amarillo dorado
        orange = "#E2A478",          -- Naranja tierra
        magenta = "#C48FD4",        -- Magenta/Púrpura suave
        cyan = "#88C0D0",           -- Cian/Turquesa
        purple = "#B48EAD",         -- Púrpura más profundo
        light_gray = "#6B707B",     -- Gris para separadores, líneas de número inactivas
    }

    -- Función auxiliar para aplicar grupos de resaltado
    -- group: nombre del grupo (ej. 'Normal', 'Comment')
    -- fg: color de primer plano (texto)
    -- bg: color de fondo
    -- style: estilo (ej. 'bold', 'italic', 'underline', 'reverse', 'none')
    local function highlight(group, fg, bg, style)
        local cmd = "hi " .. group
        if fg then cmd = cmd .. " guifg=" .. fg end
        if bg then cmd = cmd .. " guibg=" .. bg end
        if style then cmd = cmd .. " gui=" .. style end
        vim.cmd(cmd)
    end

    -- ***** GRUPOS DE RESALTADO BÁSICOS DEL EDITOR *****
    highlight("Normal", colors.foreground, colors.background_dark, nil)
    highlight("NonText", colors.light_gray, nil, nil) -- Caracteres de relleno de ventana
    highlight("EndOfBuffer", colors.background_dark, nil, nil) -- Parte inferior del buffer

    highlight("LineNr", colors.light_gray, nil, nil)          -- Números de línea
    highlight("CursorLine", nil, colors.background_light, nil) -- Línea donde está el cursor
    highlight("CursorLineNr", colors.yellow, colors.background_light, "bold") -- Número de línea donde está el cursor
    highlight("Visual", nil, "#5C616F", nil)                 -- Selección visual
    highlight("Search", colors.background_dark, colors.yellow, nil) -- Resultados de búsqueda
    highlight("IncSearch", colors.background_dark, colors.orange, nil) -- Búsqueda incremental

    -- ***** GRUPOS PARA INTERFAZ DE USUARIO (UI) *****
    highlight("StatusLine", colors.foreground, colors.background_light, "bold")         -- Barra de estado activa
    highlight("StatusLineNC", colors.comment, colors.background_dark, nil)             -- Barra de estado inactiva
    highlight("VertSplit", colors.light_gray, colors.background_dark, nil)            -- Separador de ventanas verticales
    highlight("Pmenu", colors.foreground, colors.background_light, nil)               -- Menú de autocompletado (popup menu)
    highlight("PmenuSel", colors.background_dark, colors.blue, nil)                  -- Selección en menú de autocompletado
    highlight("FoldColumn", colors.cyan, colors.background_dark, nil)                  -- Columna de pliegues (folds)
    highlight("SignColumn", colors.cyan, colors.background_dark, nil)                  -- Columna de signos (diagnósticos, git)
    highlight("ColorColumn", nil, "#4A4F5B", nil)                                      -- Columna de color (para límite de línea, ej. set colorcolumn=80)
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
    highlight("DiagnosticError", colors.red, nil, nil)
    highlight("DiagnosticWarn", colors.yellow, nil, nil)
    highlight("DiagnosticInfo", colors.blue, nil, nil)
    highlight("DiagnosticHint", colors.cyan, nil, nil)

    -- LSP virtual text (diagnósticos inline)
    highlight("LspDiagnosticsVirtualTextError", colors.red, colors.background_light, nil)
    highlight("LspDiagnosticsVirtualTextWarning", colors.yellow, colors.background_light, nil)
    highlight("LspDiagnosticsVirtualTextInfo", colors.blue, colors.background_light, nil)
    highlight("LspDiagnosticsVirtualTextHint", colors.cyan, colors.background_light, nil)

    -- ***** GRUPOS COMUNES DE PLUGINS (puedes añadir más según tus plugins) *****
    -- nvim-tree
    highlight("NvimTreeRootFolder", colors.orange, nil, "bold")
    highlight("NvimTreeFolderIcon", colors.blue, nil, nil)
    highlight("NvimTreeFileName", colors.foreground, nil, nil)
    highlight("NvimTreeFileIcon", colors.cyan, nil, nil) -- O puedes usar el color del tipo de archivo (ej. `colors.red` para .css)
    highlight("NvimTreeIndentMarker", colors.comment, nil, nil)

    -- Git signs (si usas un plugin como `gitsigns.nvim`)
    highlight("GitSignsAdd", colors.green, nil, nil)
    highlight("GitSignsChange", colors.yellow, nil, nil)
    highlight("GitSignsDelete", colors.red, nil, nil)

    -- Telescope (si usas `telescope.nvim`)
    highlight("TelescopePromptNormal", colors.foreground, colors.background_light, nil)
    highlight("TelescopePromptBorder", colors.blue, colors.background_light, nil)
    highlight("TelescopeResultsNormal", colors.foreground, colors.background_dark, nil)
    highlight("TelescopeSelection", colors.background_dark, colors.blue, nil)
    highlight("TelescopeMatching", colors.orange, nil, "bold")

    -- Lualine (si usas `lualine.nvim` para la barra de estado)
    -- Lualine tiene sus propios esquemas, pero puedes ajustar los colores base que usa.
    -- O definir un tema lualine específico dentro de su configuración.
    highlight("LualineNormal", colors.foreground, colors.background_light, nil)
    highlight("LualineInsert", colors.foreground, colors.green, nil)
    highlight("LualineVisual", colors.foreground, colors.purple, nil)
    highlight("LualineReplace", colors.foreground, colors.red, nil)
    highlight("LualineCommand", colors.foreground, colors.blue, nil)

    -- Diagnostics (si usas `vim.diagnostic.show_lines`)
    highlight("DiagnosticUnderlineError", nil, nil, "undercurl")
    highlight("DiagnosticUnderlineWarn", nil, nil, "undercurl")
    highlight("DiagnosticUnderlineInfo", nil, nil, "undercurl")
    highlight("DiagnosticUnderlineHint", nil, nil, "undercurl")
end

return M

