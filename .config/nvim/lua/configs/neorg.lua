require("neorg").setup {
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/notes",
        },
        default_workspace = "notes",
      },
    ["external.conceal-wrap"] = {},
    },
  },
}
vim.wo.foldlevel = 99
vim.wo.conceallevel = 2
