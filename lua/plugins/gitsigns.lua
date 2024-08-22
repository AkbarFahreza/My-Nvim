return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {
      signs = {
        add = { text = "+" }, -- Specify the text for added lines
        change = { text = "~" }, -- Specify the text for changed lines
        delete = { text = "_" }, -- Specify the text for deleted lines
      },
      -- other settings ...
    }

    -- Set the highlight groups directly
    vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "GitGutterAdd" })
    vim.api.nvim_set_hl(0, "GitSignsChange", { link = "GitGutterChange" })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "GitGutterDelete" })
  end,
}
