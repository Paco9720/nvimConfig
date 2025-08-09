-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Establecer Leader key antes de cargar plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Cargar opciones y atajos de teclado
require("options")
require("keymaps")

-- Cargar plugins
require("lazy").setup("plugs")

-- Cargar tema de colores personalizado
require("colorscheme").setup()

vim.opt.fillchars = { eob = ' ' }


