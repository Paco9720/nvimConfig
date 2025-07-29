-- ~/.config/nvim/lua/plugs.lua

-- Ruta de instalación de lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lista de plugins
require("lazy").setup({
  -- Sustituto de auto-pairs
  { "jiangmiao/auto-pairs" }, -- sigue funcionando aunque es Vimscript

  -- Dependencia general para otros plugins
  { "nvim-lua/plenary.nvim" },

  -- Telescope con versión específica
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- GitHub Copilot
  { "github/copilot.vim" },
})


