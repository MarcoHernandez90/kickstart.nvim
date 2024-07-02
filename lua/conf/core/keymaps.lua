-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Open Explorer
-- vim.keymap.set('n', '<leader>fe', vim.cmd.Ex)

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>[e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>[q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

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

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- Custom remaps
vim.keymap.set({ 'n', 'v' }, 'q', '<Esc>', { remap = true })
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<Leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<Leader>q', ':q<CR>', { desc = 'Close file' })
vim.keymap.set('n', '<Leader><Tab>', ':ToggleTerm size=40 dir=. direction=horizontal<CR>', { desc = 'Open terminal', noremap = true })
vim.keymap.set('n', '<Leader>>', '10<C-w>>', { desc = 'Resize split to right', noremap = true })
vim.keymap.set('n', '<Leader><', '10<C-w><', { desc = 'Resize split to left', noremap = true })
vim.keymap.set('', '<Leader>H', ':tabprevious<CR>', { desc = 'Previous tab' })
vim.keymap.set('', '<Leader>L', ':tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('', '<Leader>ob', '<cmd>Telescope buffers<CR>', { desc = 'Open buffers on Telescope' })
-- vim.keymap.set('', '<C-n>', '<Nop>')
-- vim.keymap.set('', '<C-b>', '<Nop>')
vim.keymap.set('n', '<C-j>', '10j', { desc = 'Move down 10 lines', noremap = true })
vim.keymap.set('n', '<C-k>', '10k', { desc = 'Move up 10 lines', noremap = true })
vim.keymap.set('n', '<Leader>sc', '<cmd>HopChar2<CR>', { desc = 'Hop to 2 [C]haracters' })
vim.keymap.set('n', '0', '^', { noremap = true })
vim.keymap.set('n', '^', '0', { noremap = true })
vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
vim.keymap.set('n', '[e', vim.diagnostic.open_float, { desc = 'Open diagnostic float window', noremap = true })
vim.keymap.set('n', '<Leader>x', ':!python3 %<CR>', { desc = 'Execute using python3', noremap = true })
vim.keymap.set('', 'q', '<Nop>')
vim.keymap.set('n', '<F5>', ':UndotreeToggle<CR>', { noremap = true })

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end
