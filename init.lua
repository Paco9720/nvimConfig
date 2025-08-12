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

-- Función para enviar el texto seleccionado a gemini-cli
function GeminiCli(prompt)
  -- Obtiene el texto seleccionado en modo visual
  local text = vim.fn.getreg("v")
  if text == "" then
    print("No se ha seleccionado texto.")
    return
  end
  
  -- Genera el comando
  local command = 'gemini-cli -p "' .. text .. '"'

  -- Ejecuta el comando y captura la salida
  local output = vim.fn.system(command)

  -- Inserta la salida en Neovim
  vim.api.nvim_buf_set_lines(0, vim.fn.line("."), vim.fn.line("."), false, {output})
end

-- Crea un comando en Neovim
vim.api.nvim_create_user_command("GeminiCli", GeminiCli, {
  desc = "Envía texto a gemini-cli para su procesamiento",
})

