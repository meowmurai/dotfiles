---@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins" -- path for lazy.nvim

M.ui = {
  nvdash = {
    load_on_startup = true,
  },
  theme = "catppuccin",
  hl_override = {
    -- NvimTreeCursorLine = { bg = "#2f3040" },
  },
  -- changed_themes = {
  --   catppuccin = {
  --     base_16 = {
  --       base02 = "#2f3040",
  --     },
  --     base_30 = {
  --
  --     }
  --   },
  -- },
  telescope = {
    style = "bordered",
  },
  -- transparency = true,

  -- tabufline = {
  --   show_numbers = true
  -- }
}
M.lazy_nvim = {
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        -- "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        -- "tar",
        -- "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        -- "zip",
        -- "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}
M.mappings = require "custom.mappings"

return M
