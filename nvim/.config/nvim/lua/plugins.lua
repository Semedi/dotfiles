-- Plugin management bootstrap and setup using folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate'
  },
  -- Built-in LSP configuration
  "neovim/nvim-lspconfig",

  -- Completion engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",      -- LSP source
      "hrsh7th/cmp-buffer",        -- Buffer words source
      "hrsh7th/cmp-path",          -- File path source
      "L3MON4D3/LuaSnip",          -- Snippet engine
      "saadparwaiz1/cmp_luasnip",  -- Snippet source
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
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
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer", keyword_length = 3 },
          { name = "path" },
        }),
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snip]",
              buffer = "[Buf]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },
      })
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          file_ignore_patterns = { ".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })

      pcall(telescope.load_extension, "projects")
    end,
  },

  {
    "nvim-mini/mini.comment",
    event = "VeryLazy",
    opts = {},
  },

  -- Fugitive
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
  },

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          section_separators = "",
          component_separators = "",
        },
        extensions = { "fugitive" },
      })
    end,
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Harpoon
  {
    "theprimeagen/harpoon",
    config = function()
      require("harpoon").setup({
        tabline = true,
        menu = { width = 80 },
      })
    end,
  },

  -- Web devicons
  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },

  -- Oil.nvim
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        view_options = {
          show_hidden = true,
        },
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
          winbar = "%{v:lua.require('oil').get_current_dir()}",
        },
        keymaps = {
          ["<CR>"] = "actions.select",
          ["-"] = "actions.parent",
          ["q"] = "actions.close",
          ["r"] = "actions.refresh",
          ["~"] = "actions.cd",
        },
      })
    end,
  },

  -- Theme
  "catppuccin/nvim",

  -- Project.nvim
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "Makefile", "package.json", "Cargo.toml", "go.mod" },
        silent_chdir = true,
        scope_chdir = "global",
      })
    end,
  },

  -- Opencode (AI)
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      { "folke/snacks.nvim", opts = { input = {}, picker = {} } },
    },
    config = function()
      vim.g.opencode_opts = {}
      vim.o.autoread = true

      vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask about this" })
      vim.keymap.set({ "n", "x" }, "<leader>os", function() require("opencode").select() end, { desc = "Select prompt" })
      vim.keymap.set({ "n", "x" }, "<leader>o+", function() require("opencode").prompt("@this") end, { desc = "Add this" })
      vim.keymap.set("n", "<leader>ot", function() require("opencode").toggle() end, { desc = "Toggle embedded" })
      vim.keymap.set("n", "<leader>oc", function() require("opencode").command() end, { desc = "Select command" })
      vim.keymap.set("n", "<leader>on", function() require("opencode").command("session_new") end, { desc = "New session" })
      vim.keymap.set("n", "<leader>oi", function() require("opencode").command("session_interrupt") end, { desc = "Interrupt session" })
      vim.keymap.set("n", "<leader>oA", function() require("opencode").command("agent_cycle") end, { desc = "Cycle selected agent" })
      vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("messages_half_page_up") end, { desc = "Messages half page up" })
      vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("messages_half_page_down") end, { desc = "Messages half page down" })
    end,
  },
})
