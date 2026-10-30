require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      format = { enable = true },
      keyOrdering = false,
    },
  },
})

local servers = { "html", "cssls", "yamlls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
