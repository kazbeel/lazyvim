-- Prettify JSON
vim.api.nvim_create_user_command("PrettyJson", function()
  vim.cmd("%!jq .")
end, {})

-- Minify JSON
vim.api.nvim_create_user_command("MinifyJson", function()
  vim.cmd("%!jq -c .")
end, {})
