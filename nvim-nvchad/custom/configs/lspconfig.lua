local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "jsonls", "gopls", "eslint" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    root_dir = lspconfig.util.root_pattern ".git",
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.eslint.setup {
--   root_dir = lspconfig.util.root_pattern ".git",
--   settings = {
--     packageManager = "yarn",
--     nodePath = ".yarn/sdks"
--   },
--   on_attach = function(client, bufnr)
--     on_attach(client, bufnr)
--     -- client.resolved_capabilities.document_formatting = true
--   end,
--   capabilities = capabilities,
-- }

lspconfig.tsserver.setup {
  root_dir = lspconfig.util.root_pattern ".git",
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end,
  capabilities = capabilities,
  handlers = {
    ["textDocument/definition"] = function(err, result, method, ...)
      if vim.tbl_islist(result) and type(result) ~= "table" and #result > 1 then
        local filtered = {}
        for _, v in pairs(result) do
          if string.match(v.targetUri, "global.d.ts") or string.match(v.targetUri, "react/index.d.ts") == nil then
            table.insert(filtered, v)
          end
        end
        return vim.lsp.handlers["textDocument/definition"](err, filtered, method, ...)
      end
      vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
    end,
  },
}
