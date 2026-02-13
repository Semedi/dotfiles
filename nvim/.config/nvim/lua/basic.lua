-- Basic Neovim options
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamed"
vim.o.termguicolors = true
vim.o.encoding = "utf-8"
vim.o.ignorecase = true

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'xclip-wsl',
        copy = {
            ['+'] = 'xclip -selection clipboard',
            ['*'] = 'xclip -selection primary',
        },
        paste = {
            ['+'] = 'xclip -selection clipboard -o',
            ['*'] = 'xclip -selection primary -o',
        },
        cache_enabled = 0,
    }
end
