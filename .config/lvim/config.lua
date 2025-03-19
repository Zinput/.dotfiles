-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  "catppuccin/nvim",
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {"lervag/vimtex",
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_compiler_method = 'latexmk'
    end,
  },
  "Pocco81/auto-save.nvim",
  "Joakker/lua-json5",
  "mfussenegger/nvim-dap-python",
  -- {"nvim-java/nvim-java",
  --   config = false,
  --   dependencies = {
  --   {
  --     "neovim/nvim-lspconfig",
  --     opts = {
  --       servers = {
  --         jdtls = {
  --           -- your jdtls configuration goes here
  --         },
  --       },
  --       setup = {
  --         jdtls = function()
  --           require("java").setup({
  --             -- your nvim-java configuration goes here
  --           })
  --         end,
  --       },
  --     },
  --   },
  --   },
  -- }
}

lvim.colorscheme = "catppuccin-mocha"

-- LSP config
-- add 'pyright' to 'skipped_servers' list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- remove 'pylsp' from 'skipped_servers' list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "pylsp"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- DAP config
require('dap.ext.vscode').json_decode = require'json5'.parse
require('dap.ext.vscode').load_launchjs(nil, {cppdbg = {'c', 'cpp'}})
require('dap-python').setup('python')

local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = 'lldb'
}

dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb',
  args = { '-i', 'dap' }
}

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/jason/.local/share/nvim/custom/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7'
}

-- Copilot config
local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
