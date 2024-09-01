vim.filetype.add {
  extension = {
    mdx = "mdx",
  },
}
return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  { "mfussenegger/nvim-dap" },

  {
    "akinsho/flutter-tools.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require "plugins.flutter-tools"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return {
        ensure_installed = {
          "lua",
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "json",
        "svelte"
                },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        auto_install = true,
      }
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
      -- Use the markdown parser for mdx files
      vim.treesitter.language.register("markdown", "mdx")

      -- Extend Treesitter to handle import/export in MDX files as TypeScript
      require("nvim-treesitter").define_modules {
        mdx_ext = {
          extend = function(lang, _)
            if lang == "markdown" then
              return {
                injections = {
                  {
                    language = "typescript",
                    content = {
                      "^%s*import",
                      "^%s*export",
                    },
                  },
                },
              }
            end
          end,
        },
      }
    end,
  },
}
