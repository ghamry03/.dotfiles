local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

local leader = function(key)
  vim.g.mapleader = key
  vim.g.maplocalleader = key
  map({ 'n', 'v' }, key, '<nop>')
end

leader ' '

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

map('i', 'jk', '<esc>')

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
map('n', '<leader>nh', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, 'Go to previous [D]iagnostic message')
map('n', ']d', vim.diagnostic.goto_next, 'Go to next [D]iagnostic message')
map('n', '<leader>e', vim.diagnostic.open_float, 'Show diagnostic [E]rror messages')
map('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode')

-- TIP: Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- map('n', '<C-h>', '<C-w><C-h>', 'Move focus to the left window')
-- map('n', '<C-l>', '<C-w><C-l>', 'Move focus to the right window')
-- map('n', '<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
-- map('n', '<C-k>', '<C-w><C-k>', 'Move focus to the upper window')
map('n', '<leader>w+', '<C-w>+', 'Increase height')
map('n', '<leader>w-', '<C-w>-', 'Decrease height')
map('n', '<leader>w>', '<C-w>>', 'Increase width')
map('n', '<leader>w<', '<C-w><', 'Decrease width')
map('n', '<leader>w=', '<C-w>=', 'Make all windows equally high and wide')
map('n', '<leader>w_', ':resize max<CR>', 'Max out the height')
map('n', '<leader>w|', ':vertical resize max<CR>', 'Max out the width')
map('n', '<leader>wo', '<C-w>o', 'Close all other windows')
map('n', '<leader>wq', '<C-w>q', 'Quit a window')
map('n', '<leader>ws', ':split<CR>', 'Split window horizontally')
map('n', '<leader>wv', ':vsplit<CR>', 'Split window vertically')
map('n', '<leader>wx', '<C-w>x', 'Swap current with next window')

map('n', '<C-u>', '<C-u>zz', 'Half a page up')
map('n', '<C-d>', '<C-d>zz', 'Half a page down')

map('n', '<leader>ha', "<cmd>lua require('harpoon.mark').add_file()<CR>", 'Harpoon mark file')
map('n', '<leader>hh', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", 'Harpoon toggle menu')
map('n', '<leader>ht', function()
  local input = vim.fn.input 'file index: '
  local num = tonumber(input)
  print ' '
  if num then
    print(require('harpoon.ui').nav_file(num))
  end
end, 'Harpoon toggle menu')
map('n', '<leader>h1', function()
  require('harpoon.ui').nav_file(1)
end)
map('n', '<leader>h2', function()
  require('harpoon.ui').nav_file(2)
end)
map('n', '<leader>h3', function()
  require('harpoon.ui').nav_file(3)
end)
map('n', '<leader>h4', function()
  require('harpoon.ui').nav_file(4)
end)
map('n', '<leader>h5', function()
  require('harpoon.ui').nav_file(5)
end)
map('n', '<leader>h6', function()
  require('harpoon.ui').nav_file(6)
end)
map('n', '<leader>h7', function()
  require('harpoon.ui').nav_file(7)
end)
map('n', '<leader>h8', function()
  require('harpoon.ui').nav_file(8)
end)
map('n', '<leader>h9', function()
  require('harpoon.ui').nav_file(9)
end)

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
