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
  -- Treesitter for enhanced syntax highlighting and indenting
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },

  -- Built-in LSP configuration
  "neovim/nvim-lspconfig",

  -- Telescope for fuzzy finding with dependency plenary
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
  },

  -- Fugitive for Git integration with lazy load on commands
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
  },

  -- Status line with Catppuccin theme and fugitive integration
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          section_separators = "",
          component_separators = ""
        },
        extensions = {"fugitive"},
      })
    end,
  },

  -- Git signs in sign column
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Harpoon for quick file navigation with tabline and menu
  {
    "theprimeagen/harpoon",
    config = function()
      require("harpoon").setup{
        tabline = true,
        menu = { width = 80 },
      }
    end,
  },

  -- Web devicons for filetype icons
  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },

  -- Oil.nvim as lightweight file explorer
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

  -- Catppuccin theme
  "catppuccin/nvim",

  -- Project.nvim for auto project detection and management
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
})

-- Treesitter setup
require("nvim-treesitter.configs").setup({
  ensure_installed = {"c", "cpp", "lua", "python", "rust", "typescript", "bash"},
  highlight = { enable = true },
  indent = { enable = true },
})

-- Load Telescope projects extension
require("telescope").load_extension("projects")
