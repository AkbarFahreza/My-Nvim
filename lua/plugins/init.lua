return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require "nvim-treesitter.configs"

      configs.setup {
        ensure_installed = {
          "lua",
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "svelte",
          "go",
          "json",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
      }
    end,
  },
}
