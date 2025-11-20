vim.api.nvim_create_user_command("Tt", "execute '%s/\\t/    /g' | retab", {})
