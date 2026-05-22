require "nvchad.autocmds"
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
  callback = function()
    require("conform").format { async = false, lsp_fallback = true }
  end,
})



