local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: Find Files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = 'Telescope: Live Grep' })
vim.keymap.set('n', '<leader>bb', builtin.buffers,    { desc = 'Telescope: Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = 'Telescope: Help Tags' })

vim.keymap.set('n', '<leader>fb', function()
  require('telescope').extensions.file_browser.file_browser({
    hidden = true,           -- show hidden files
    respect_gitignore = false -- show everything even if .gitignore hides it
  })
end, { desc = 'File Browser (with hidden files)' })

vim.keymap.set('n', '<leader>fe', function()
  require('telescope').extensions.file_browser.file_browser({
    path = "%:p:h", -- current buffer's directory
    hidden = true,
    respect_gitignore = false,
    select_buffer = true
  })
end, { desc = 'File Browser at current file' })
