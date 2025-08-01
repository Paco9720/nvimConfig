-- ~/.config/nvim/init.lua

-- --- Configuración de Opciones de Neovim ---
-- Carga tus opciones generales (tabs, números de línea, etc.)
require('config')

-- --- Configuración de Atajos de Teclado ---
-- Carga tus atajos de teclado, incluyendo el `leader` key
require('shortcuts')

-- --- Carga de Tema ---
-- Esto carga el tema que definimos para el editor
require('black').setup()

-- --- GESTOR DE PLUGINS (Lazy.nvim) ---
-- Este es el bloque de código crucial para inicializar Lazy.nvim.
-- Lo primero que hace es configurar el 'runtimepath' de Neovim
-- para que apunte al directorio de Lazy.nvim.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Esta línea es la que realmente activa y carga tus plugins.
-- Le dice a Lazy.nvim que busque los plugins en el archivo "plugins.lua".
require("lazy").setup("plugs", {})

-- ... (cualquier otra configuración que tengas después de los plugins) ...

