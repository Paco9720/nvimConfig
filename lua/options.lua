-- Opciones generales de Neovim

vim.opt.backup = false             -- No crear archivos de backup
vim.opt.writebackup = false        -- No crear archivos de backup al escribir
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir" -- Directorio para historial de undo
vim.opt.undofile = true            -- Habilitar historial de undo persistente

vim.opt.hlsearch = true            -- Resaltar resultados de búsqueda
vim.opt.incsearch = true           -- Búsqueda incremental

vim.opt.termguicolors = true       -- Habilitar colores verdaderos en el terminal

vim.opt.scrolloff = 8              -- Líneas de contexto al desplazarse
vim.opt.sidescrolloff = 8          -- Columnas de contexto al desplazarse lateralmente

vim.opt.tabstop = 2                -- Ancho de un tab
vim.opt.shiftwidth = 2             -- Ancho de sangría
vim.opt.expandtab = true           -- Usar espacios en lugar de tabs
vim.opt.autoindent = true          -- Auto-sangría

vim.opt.number = true              -- Mostrar números de línea

vim.opt.cursorline = true          -- Resaltar la línea actual

vim.opt.mouse = "a"                -- Habilitar el ratón en todos los modos

vim.opt.splitright = true          -- Dividir ventanas a la derecha por defecto
vim.opt.splitbelow = true          -- Dividir ventanas abajo por defecto

vim.opt.ignorecase = true          -- Ignorar mayúsculas/minúsculas en búsquedas
vim.opt.smartcase = true           -- No ignorar mayúsculas/minúsculas si hay mayúsculas en la búsqueda

vim.opt.updatetime = 300           -- Tiempo para escribir el swapfile
vim.opt.timeoutlen = 500           -- Tiempo de espera para keycodes

vim.opt.signcolumn = "yes"         -- Mostrar columna de signos (para LSP, etc.)

vim.opt.isfname:append("@-@")     -- Caracteres adicionales para nombres de archivo

vim.opt.wrap = false               -- No envolver líneas largas

vim.opt.clipboard = 'unnamedplus'
