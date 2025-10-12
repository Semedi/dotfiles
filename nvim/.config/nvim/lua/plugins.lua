local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.cmd("packadd packer.nvim")
end

require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  use "neovim/nvim-lspconfig"

  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }

  use "nvim-lualine/lualine.nvim"
  use "lewis6991/gitsigns.nvim"
  use {"theprimeagen/harpoon", config = function() require("harpoon").setup{tabline=true, menu={width=80}} end}
  use "sindrets/diffview.nvim"
  use "catppuccin/nvim"
  use "ahmedkhalf/project.nvim"
  use { "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } }

  -- Add more plugins here as needed
end)

vim.cmd [[
  augroup packer_autocompile
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup END
]]

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
