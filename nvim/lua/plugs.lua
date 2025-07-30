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
return require("lazy").setup({
  -- --- Gestores de Mason (DEBEN CARGARSE PRIMERO) ---
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup()
    end,
  },

  -- --- Dependencia de UI general (nui.nvim) ---
  -- Se declara aquí como un plugin de nivel superior para asegurar que se cargue
  -- antes que otros plugins que puedan depender de él para componentes de UI.
  {
    "MunifTanjim/nui.nvim",
    -- No se especifica 'lazy = true' o un evento, forzando su carga temprana.
    -- Esto es crucial para plugins como avante.nvim que lo requieren en su config.
  },

  -- --- Plugin avante.nvim ---
  {
    "yetone/avante.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      -- 'MunifTanjim/nui.nvim' ya está declarado arriba, pero se puede mantener aquí
      -- como recordatorio de la dependencia si se desea. Lazy.nvim no lo instalará dos veces.
    },
    config = function()
      require("avante").setup({
        -- Aquí puedes añadir opciones de configuración para Avante
        -- Por ejemplo:
        -- debug = true, -- Descomenta para depurar
        -- handlers = require("avante.config.handlers").build({
        --   tsserver = true, -- Habilita tsserver
        --   lua_ls = {
        --     -- Configuración específica para lua_ls
        --     Lua = {
        --       workspace = { checkThirdParty = false },
        --       telemetry = { enable = false },
        --     },
        --   },
        -- }),
      })

      -- Opcional: Si quieres mantener nvim-lspconfig para servidores no gestionados por Avante,
      -- puedes cargarlo después y configurar algunos.
      -- require("lspconfig").rust_analyzer.setup({})
    end,
  },

  -- --- Otros plugins ---
  { "jiangmiao/auto-pairs" },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "github/copilot.vim" },

  -- Si otros plugins también usan nui.nvim, ya está declarado arriba.
})

