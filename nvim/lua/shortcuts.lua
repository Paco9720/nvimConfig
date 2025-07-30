-- lua/keymaps.lua

-- Define la tecla 'leader' como Espacio
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Función auxiliar para mapear teclas de forma más concisa
local map = vim.keymap.set
local opts = { silent = true } -- Opción común para que los mapeos no muestren mensajes

-- --- Atajos en Modo Normal (n) ---

-- Guardar archivo
map('n', '<leader>w', ':w<CR>', { desc = 'Guardar archivo' })
-- <leader> + w (Espacio + w)

-- Salir de Neovim
map('n', '<leader>q', ':q<CR>', { desc = 'Salir de Neovim' })
-- <leader> + q (Espacio + q)

-- Guardar y Salir
map('n', '<leader>wq', ':wq<CR>', { desc = 'Guardar y salir de Neovim' })
-- <leader> + wq (Espacio + wq)

-- Salir sin guardar (forzado)
map('n', '<leader>Q', ':qa!<CR>', { desc = 'Salir de Neovim sin guardar (forzado)' })
-- <leader> + Q (Espacio + Shift + q)

-- Abrir Telescope (Find Files)
-- Asegúrate de que Telescope esté instalado y configurado en tu 'plugins.lua'
-- Este mapeo asume que estás usando la función find_files de Telescope.
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Buscar archivos' })
-- <leader> + ff (Espacio + f + f)

-- Abrir Telescope (Live Grep - buscar texto en archivos)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Buscar texto en archivos' })
-- <leader> + fg (Espacio + f + g)

-- Limpiar resaltado de búsqueda
map('n', '<leader>h', ':noh<CR>', { desc = 'Limpiar resaltado de búsqueda' })
-- <leader> + h (Espacio + h)

-- --- Otros atajos que podrías tener o querer añadir ---

-- Navegación entre ventanas (con Ctrl y h/j/k/l)
map('n', '<C-h>', '<C-w>h', { desc = 'Moverse a la ventana izquierda' })
map('n', '<C-j>', '<C-w>j', { desc = 'Moverse a la ventana de abajo' })
map('n', '<C-k>', '<C-w>k', { desc = 'Moverse a la ventana de arriba' })
map('n', '<C-l>', '<C-w>l', { desc = 'Moverse a la ventana derecha' })

-- Navegación entre buffers (archivos abiertos)
map('n', '<Tab>', ':bnext<CR>', { desc = 'Siguiente buffer' })
map('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Buffer anterior' })

-- Mover líneas de texto en modo visual
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Mover línea seleccionada hacia abajo' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Mover línea seleccionada hacia arriba' })

