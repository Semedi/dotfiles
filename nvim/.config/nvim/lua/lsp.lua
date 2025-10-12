local on_attach = function(client, bufnr)
  -- Buffer local keymaps can go here, or globally as shown before
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Add your LSP servers here
local servers = { "pyright", "tsserver", "terraformls", "rust_analyzer" }

vim.lsp.enable('pyright')
vim.lsp.enable('ts_ls')
vim.lsp.enable('terraformls')
vim.lsp.enable('rust_analyzer')
