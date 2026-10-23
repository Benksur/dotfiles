require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "gopls", "jsonls", "ts_ls", "eslint" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

-- run eslint --fix on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function(args)
    local client = vim.lsp.get_clients({ bufnr = args.buf, name = "eslint" })[1]
    if not client then
      return
    end
    client:request_sync("workspace/executeCommand", {
      command = "eslint.applyAllFixes",
      arguments = {
        { uri = vim.uri_from_bufnr(args.buf), version = vim.lsp.util.buf_versions[args.buf] },
      },
    }, 5000, args.buf)
  end,
})
