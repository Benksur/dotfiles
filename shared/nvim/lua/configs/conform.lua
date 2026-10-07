local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofmt" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    json = { "prettier" },
    jsonc = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
