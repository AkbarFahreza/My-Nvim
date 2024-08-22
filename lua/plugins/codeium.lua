return {
  {
    "Exafunction/codeium.vim",
    config = function()
      -- Optional: Customize the key bindings for Codeium
      -- This example sets <Tab> to accept the suggestion and <Ctrl-e> to cycle through suggestions
      vim.keymap.set('i', '<A-a>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<C-e>', function() return vim.fn end, { expr = true })
      vim.keymap.set('i', '<C-d>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    end,
  }
}
