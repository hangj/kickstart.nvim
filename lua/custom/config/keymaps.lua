if vim.g.neovide then
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('i', '<D-s>', '<CMD>w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })

-- command-left/right goto start/end of current line
vim.keymap.set('i', '<D-Right>', '<ESC>A')
vim.keymap.set('i', '<D-Left>', '<ESC>I')
vim.keymap.set('n', '<D-Right>', '$')
vim.keymap.set('n', '<D-Left>', '^')

-- comment the line
vim.keymap.set({ 'n', 'v', 'i' }, '<D-/>', '<ESC>gcc', { remap = true })

-- command-w close current buffer
-- `<cmd>bd<cr>` does not work, don't know why
vim.keymap.set({ 'i', 'n', 'v' }, '<D-w>', function()
  Snacks.bufdelete()
end)

-- Ctrl-Tab goto next buffer
vim.keymap.set({ 'i', 'n', 'v' }, '<C-Tab>', '<CMD>bnext<CR>')
vim.keymap.set({ 'i', 'n', 'v' }, '<C-S-Tab>', '<CMD>bprevious<CR>')

-- command-p
vim.keymap.set('n', '<D-p>', function()
  LazyVim.pick 'files'()
end)
vim.keymap.set('n', '<D-S-f>', function()
  LazyVim.pick 'live_grep'()
end)
-- Alt-Left
vim.keymap.set('n', '<A-Left>', 'b')
vim.keymap.set('n', '<A-Right>', 'w')

return {}
