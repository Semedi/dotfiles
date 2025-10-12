local map = vim.keymap.set
local opts = { silent = true }

map("n", "<C-s>", ":w<CR>", opts)
map("i", "jk", "<ESC>", opts)
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>gs", ":Telescope git_status<CR>", opts)
