require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "gopls", "jsonls", "ts_ls", "eslint" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

-- run eslint --fix on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function(args)
    local clients = vim.lsp.get_clients { bufnr = args.buf, name = "eslint" }
    if #clients > 0 then
      vim.cmd "EslintFixAll"
    end
  end,
})
