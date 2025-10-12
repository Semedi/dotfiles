vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd("%s/\\s\\+$//e")
  end,
})

vim.api.nvim_create_user_command("ReloadConfig", "source $HOME/.config/nvim/init.lua", {})

