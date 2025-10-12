local lspconfig = require("lspconfig")

local servers = {
  "pyright",
  "ts_ls",
  "terraformls",
  "rust_analyzer",
  "gopls",
  "clangd",
}

local on_attach = function(client, bufnr)
  -- Aquí puedes añadir keymaps o configuraciones específicas del buffer
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
