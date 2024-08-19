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
      require('colorizer').setup({
        '*'; -- Highlight all files
        css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in CSS
        html = { names = true; }; -- Disable color names like `Blue` or `Gray`
      })

      -- To toggle colorizer
      vim.cmd [[ColorizerToggle]]
    end,
  }
}
