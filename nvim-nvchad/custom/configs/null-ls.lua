local null_ls = require "null-ls"

local format = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostics

local sources = {

  -- webdev stuff
  -- format.deno_fmt,
  -- b.formatting.prettier,
  format.prettierd,
  -- Lua
  format.stylua,

  -- Shell
  format.shfmt,
  diagnostic.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  format.clang_format,
}

null_ls.setup {
  debug = false,
  sources = sources,
}
