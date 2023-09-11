local overrides = require "custom.configs.overrides"

return {

  ----------------------------------------- default plugins ------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        -- trigger_characters is for unocss lsp
        { name = "nvim_lsp", trigger_characters = { "-" } },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        -- format & linting
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },

    config = function()
      -- require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- override default configs
  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
          enable = true,
          max_lines = 0,
          min_window_height = 0,
          line_numbers = true,
          multiline_threshold = 20,
          trim_scope = "outer",
          mode = "cursor",
          separator = nil,
          zindex = 20,
          on_attach = nil,
        },
        config = function(_, opts)
          require("treesitter-context").setup(opts)
        end,
      },
    },
    opts = overrides.treesitter,
  },
  { "williamboman/mason.nvim", opts = overrides.mason },

  --------------------------------------------- custom plugins ----------------------------------------------

  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
    end,
  },

  -- autoclose tags in html, jsx only
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- get highlight group under cursor
  {
    "nvim-treesitter/playground",
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },

  -- dim inactive windows
  {
    "andreadev-it/shade.nvim",
    keys = "<Bslash>",
    config = function()
      require("shade").setup {
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end,
  },

  {
    "elkowar/yuck.vim",
    config = function()
      vim.opt.ft = "yuck"
    end,
  },

  -- Lua
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "custom.configs.zenmode"
    end,
  },
  {
    "NvChad/nvterm",
    opts = {
      terminals = {
        type_opts = {
          float = {
            width = 1,
            border = "single",
          },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-telescope/telescope-live-grep-args.nvim",
    opts = function()
      local defaultOpts = require "plugins.configs.telescope"
      local myOpts = require "custom.configs.telescope"
      return vim.tbl_deep_extend("force", defaultOpts, myOpts)
    end,
  },
}
