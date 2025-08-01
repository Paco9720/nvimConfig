-- ~/.config/nvim/lua/plugins.lua

-- Configuración modular para un entorno de desarrollo completo.
-- Lazy.nvim leerá este archivo para gestionar los plugins.

return {

  -- --- PLUGINS BASE ---
  -- Estos plugins son necesarios para que toda la configuración funcione.
  { "nvim-lua/plenary.nvim" },
  { "L3MON4D3/LuaSnip" }, -- Motor de snippets
  { "onsails/lspkind.nvim" }, -- Íconos para LSP
  { "MunifTanjim/nui.nvim" }, -- Utilidades de UI (importante para Telescope y otros plugins)

  -- --- MASON: Gestor de servidores de lenguaje ---
  -- Mason se encarga de instalar y gestionar los ejecutables.
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "⟳",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- --- MASON-LSPCONFIG: Conector de Mason con el cliente LSP ---
  -- Este plugin vincula los servidores de Mason con nvim-lspconfig.
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" }, -- Depende de Mason para funcionar
    config = function()
      -- Hemos movido la configuración de `handlers` dentro del `setup` de
      -- `mason-lspconfig` para evitar errores de orden de carga.
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",     -- Para Lua
          "pyright",    -- Para Python
          "tsserver",   -- Para TypeScript/JavaScript
          "jsonls",     -- Para JSON
          "html",       -- Para HTML
          "cssls",      -- Para CSS
          -- Puedes agregar más aquí según tus necesidades
        },
        handlers = {
          -- Este handler se ejecutará para cada servidor de lenguaje
          function(server_name)
            require("lspconfig")[server_name].setup({
              on_attach = function(client, bufnr)
                -- Mapeos de teclado comunes de LSP
                -- Nota: `<leader>` ya se ha configurado como ' '
                local opts = { noremap = true, silent = true }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
                vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
              end,
            })
          end,
        },
      })
    end,
  },

  -- --- CLIENTE LSP: El cerebro de las funcionalidades ---
  -- nvim-lspconfig es el cliente que se comunica con los servidores.
  {
    "neovim/nvim-lspconfig",
    -- No necesitamos un bloque `config` aquí, ya que toda la configuración
    -- de los servidores se maneja a través de `mason-lspconfig`
    -- en el bloque de arriba.
  },

  -- --- AUTOCOMPLETADO: El motor de las sugerencias ---
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Fuente de sugerencias para LSP
      "hrsh7th/cmp-buffer",   -- Fuente para completar palabras en el buffer actual
      "hrsh7th/cmp-path",     -- Fuente para completar rutas de archivos
      "saadparwaiz1/cmp_luasnip", -- Conexión entre cmp y LuaSnip
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        formatting = {
          format = lspkind.cmp_format({
            with_text = true,
            menu = {
              nvim_lsp = "[LSP]",
              luasnip = "[Snip]",
              buffer = "[Buffer]",
              path = "[Path]",
            },
          }),
        },
      })
    end,
  },

  -- --- TELESCOPE: Herramienta de búsqueda ---
  {
    "nvim-telescope/telescope.nvim",
    -- La dependencia "nvim-lua/plenary.nvim" ya está declarada arriba.
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { ".git/", "node_modules/" },
        },
      })
    end,
  },

  -- --- AUTO-PAIRS: Cierre automático de caracteres ---
  {
    "jiangmiao/auto-pairs",
    -- Este plugin no necesita una configuración especial, solo se carga.
  },
}

