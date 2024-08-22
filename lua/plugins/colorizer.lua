return {
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*", -- Highlight all files
        css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in CSS
        html = { names = true }, -- Disable color names like `Blue` or `Gray`
      }, {
        rgb_fn = true, -- Enable parsing rgb(...) functions
        hsl_fn = true, -- Enable parsing hsl(...) functions
        css = true, -- Enable parsing css variables like --var: #fff;
        css_fn = true, -- Enable parsing css functions like rgba(...), hsla(...)
      })

      -- To toggle colorizer
      vim.cmd [[ColorizerToggle]]
    end,
  },
}
