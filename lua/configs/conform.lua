local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    sql = { "sqlfluff" },
    -- yaml sin formatter propio: cae al LSP (yamlls) via lsp_format = "fallback"
    -- css = { "prettier" },
    -- html = { "prettier" },
  },
  formatters = {
    sqlfluff = {
      command = "sqlfluff",
      args = { "format", "--dialect", "bigquery", "-" },
      stdin = true,
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2000,
    lsp_format = "fallback",
  },
}

return options
