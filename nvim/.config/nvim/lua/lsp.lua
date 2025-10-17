local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end


-- Add your LSP servers here
local servers = { "pyright", "tsserver", "terraformls", "rust_analyzer" }

vim.lsp.enable('pyright')
vim.lsp.enable('ts_ls')
vim.lsp.enable('terraformls')
vim.lsp.enable('rust_analyzer')

-- Rust
--vim.lsp.config('rust_analyzer', {
--  on_attach = on_attach,
--  capabilities = capabilities,
--  settings = {
--    ["rust-analyzer"] = {
--      checkOnSave = {
--        command = "clippy",
--      },
--      cargo = {
--        allFeatures = true,
--      },
--    },
--  },
--})

---- TypeScript/JavaScript
--lspconfig.ts_ls.setup({
--  on_attach = on_attach,
--  capabilities = capabilities,
--})
--
---- Python
--lspconfig.pyright.setup({
--  on_attach = on_attach,
--  capabilities = capabilities,
--  settings = {
--    python = {
--      analysis = {
--        typeCheckingMode = "basic",
--        autoSearchPaths = true,
--        useLibraryCodeForTypes = true,
--      },
--    },
--  },
--})
--
---- C/C++
--lspconfig.clangd.setup({
--  on_attach = on_attach,
--  capabilities = capabilities,
--  cmd = {
--    "clangd",
--    "--background-index",
--    "--clang-tidy",
--    "--header-insertion=iwyu",
--    "--completion-style=detailed",
--    "--function-arg-placeholders",
--  },
--})
--
---- Bash
--lspconfig.bashls.setup({
--  on_attach = on_attach,
--  capabilities = capabilities,
--})
--
---- Lua (for Neovim config development)
--lspconfig.lua_ls.setup({
--  on_attach = on_attach,
--  capabilities = capabilities,
--  settings = {
--    Lua = {
--      runtime = {
--        version = "LuaJIT",
--      },
--      diagnostics = {
--        globals = { "vim" },
--      },
--      workspace = {
--        library = vim.api.nvim_get_runtime_file("", true),
--        checkThirdParty = false,
--      },
--      telemetry = {
--        enable = false,
--      },
--    },
--  },
--})
