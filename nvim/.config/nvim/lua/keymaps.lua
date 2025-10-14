local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "<C-s>", ":w<CR>", opts)
map("i", "jk", "<ESC>", opts)

map('n', '<leader><leader>', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>gs', ':Telescope git_status<CR>', opts)

map("n", "<leader>gs", ":Git<CR>", opts)


map("n", "<leader>e", "<cmd>Oil<CR>", opts)
-- Up level dir
map("n", "-", "<cmd>Oil<CR>", opts)

-- LSP keymaps
map('n', 'gd', vim.lsp.buf.definition, opts)
map('n', 'gD', vim.lsp.buf.declaration, opts)
map('n', 'gi', vim.lsp.buf.implementation, opts)
map('n', 'gr', vim.lsp.buf.references, opts)
map('n', 'K', vim.lsp.buf.hover, opts)
map('n', '<leader>rn', vim.lsp.buf.rename, opts)
map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
map('n', '<leader>f', vim.lsp.buf.format, opts)
map('i', '<C-k>', vim.lsp.buf.signature_help, opts)
map('n', '<leader>ds', vim.lsp.buf.document_symbol, opts)
map('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)


-- harpoon
map("n", "<leader>a", function() require("harpoon.mark").add_file() end, opts)

-- Abrir menú visual de harpoon con lista de marcadores
map("n", "<leader>h", function() require("harpoon.ui").toggle_quick_menu() end, opts)

-- Navegación rápida a archivos marcados
map("n", "<leader>1", function() require("harpoon.ui").nav_file(1) end, opts)
map("n", "<leader>2", function() require("harpoon.ui").nav_file(2) end, opts)
map("n", "<leader>3", function() require("harpoon.ui").nav_file(3) end, opts)
map("n", "<leader>4", function() require("harpoon.ui").nav_file(4) end, opts)
map("n", "<leader>5", function() require("harpoon.ui").nav_file(5) end, opts)
