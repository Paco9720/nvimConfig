-- Atajos de teclado (Keymaps)

local map = vim.keymap.set

-- Modo Normal

-- Navegación entre ventanas
map("n", "<C-h>", "<C-w>h", { desc = "Moverse a la ventana izquierda" })
map("n", "<C-l>", "<C-w>l", { desc = "Moverse a la ventana derecha" })
map("n", "<C-j>", "<C-w>j", { desc = "Moverse a la ventana de abajo" })
map("n", "<C-k>", "<C-w>k", { desc = "Moverse a la ventana de arriba" })

-- Redimensionar ventanas
map("n", "<leader>h", ":vertical resize -2<CR>", { desc = "Reducir ancho de ventana" })
map("n", "<leader>l", ":vertical resize +2<CR>", { desc = "Aumentar ancho de ventana" })
map("n", "<leader>j", ":resize -2<CR>", { desc = "Reducir alto de ventana" })
map("n", "<leader>k", ":resize +2<CR>", { desc = "Aumentar alto de ventana" })

-- Guardar y salir
map("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
map("n", "<leader>q", ":q<CR>", { desc = "Cerrar ventana/buffer" })
map("n", "<leader>Q", ":qa<CR>", { desc = "Cerrar todas las ventanas/buffers" })

-- Modo Visual

-- Mantener selección al indentar
map("v", ">", ">gV")
map("v", "<", "<gV")

-- Mover líneas seleccionadas
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover línea(s) seleccionada(s) hacia abajo" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover línea(s) seleccionada(s) hacia arriba" })

-- Modo Insertar

-- Moverse entre líneas lógicas (sin saltar líneas envueltas)
map("i", "<C-j>", "<Esc>jA", { desc = "Moverse a la siguiente línea lógica" })
map("i", "<C-k>", "<Esc>kA", { desc = "Moverse a la anterior línea lógica" })

-- Modo Terminal

-- Salir del modo terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Salir del modo terminal" })

-- Plugins (se configurarán más adelante)

-- NvimTree (explorador de archivos)
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Alternar NvimTree" })

-- Telescope (buscador de archivos)
map("n", "<leader>f", ":Telescope find_files<CR>", { desc = "Buscar archivos" })
map("n", "<leader>g", ":Telescope live_grep<CR>", { desc = "Buscar texto en archivos" })

-- LSP (Language Server Protocol)
map("n", "gd", vim.lsp.buf.definition, { desc = "Ir a definición" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Ir a declaración" })
map("n", "gr", vim.lsp.buf.references, { desc = "Mostrar referencias" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Ir a implementación" })
map("n", "K", vim.lsp.buf.hover, { desc = "Mostrar información al pasar el ratón" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renombrar símbolo" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Acciones de código" })
map("n", "<leader>F", function() vim.lsp.buf.format { async = true } end, { desc = "Formatear código" })

-- Diagnósticos
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Ir al diagnóstico anterior" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Ir al diagnóstico siguiente" })
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Mostrar diagnóstico flotante" })
