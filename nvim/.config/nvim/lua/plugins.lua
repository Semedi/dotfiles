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
  { "nvim-tree/nvim-web-devicons", opts = {} },
  "stevearc/oil.nvim",
  "catppuccin/nvim",
  "ahmedkhalf/project.nvim",
})

-- Treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = {"c", "cpp", "lua", "python", "rust", "typescript", "bash"},
  highlight = {enable = true},
  indent = {enable = true},
})

-- Lualine
require("lualine").setup({
  options = { theme = "catppuccin", section_separators = "", component_separators = "" }
})

-- Gitsigns
require("gitsigns").setup()


-- Harpoon
require("oil").setup({
  default_file_explorer = true,
  columns = { "icon", "size", "mtime" },
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
    ["<CR>"] = "actions.select",      -- Abrir archivo o directorio
    ["-"] = "actions.parent",         -- Subir nivel del árbol
    ["q"] = "actions.close",          -- Cerrar buffer
    ["r"] = "actions.refresh",        -- Refrescar vista
    ["~"] = "actions.cd",             -- Ir al home
  }
})
