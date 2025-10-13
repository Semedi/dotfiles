local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },

  "neovim/nvim-lspconfig",

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  "nvim-lualine/lualine.nvim",
  "lewis6991/gitsigns.nvim",
  {
    "theprimeagen/harpoon",
    config = function()
      require("harpoon").setup {
        tabline = true,
        menu = { width = 80 },
      }
    end,
  },
  "catppuccin/nvim",
  "ahmedkhalf/project.nvim",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
})


-- Treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = {"c", "cpp", "lua", "python", "rust", "typescript", "bash"},
  highlight = {enable = true},
  indent = {enable = true},
})

-- Nvim-tree
require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  update_cwd = true,
  hijack_cursor = true,
  view = { side = "left", width = 30 },
  renderer = {
    icons = { show = { file = true, folder = true, git = true } },
    indent_markers = { enable = true },
  },
  filters = {
    dotfiles = false,
    custom = { ".git", "node_modules" },
  },
  git = { enable = true, ignore = false },
  diagnostics = {
    enable = true,
    icons = { hint = "", info = "", warning = "", error = "" },
  },
})

-- Lualine
require("lualine").setup({
  options = { theme = "catppuccin", section_separators = "", component_separators = "" }
})

-- Gitsigns
require("gitsigns").setup()
