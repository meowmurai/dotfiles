local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<S-l>"] = { ":bnext<CR>", "next buffer" },
    ["<S-h>"] = { ":bprevious<CR>", "previous buffer" },
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>fg"] = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" },
    ["=="] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>" },
  },
}

return M
