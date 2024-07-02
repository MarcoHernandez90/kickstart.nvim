return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local nvimtree = require 'nvim-tree'

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup {
      view = {
        width = 35,
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        highlight_git = 'name',
        -- highlight_opened_files = 'name',
        highlight_diagnostics = 'all',
        highlight_bookmarks= 'all',
        icons = {
          show = {
            git = false
          },
          glyphs = {
            -- folder = {
            --   -- arrow_closed = '', -- arrow when folder is closed
            --   -- arrow_open = '', -- arrow when folder is open
            --   -- arrow_closed = '', -- arrow when folder is closed
            --   -- arrow_open = '', -- arrow when folder is open
            -- },
            -- git = {
            --   -- Git style symbols
            --   -- unstaged  = "U",
            --   -- staged    = "A",
            --   -- unmerged  = "M",
            --   -- renamed   = "R",
            --   -- untracked = "?",
            --   -- deleted   = "D",
            --   -- ignored   = "!"
            -- }
          },
        },
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    }

    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<Leader>nt', '<cmd>NvimTreeFindFileToggle<CR>', { desc = '[T]oggle file explorer' })
    keymap.set('n', '<Leader>nc', '<cmd>NvimTreeClose<CR>', { desc = '[C]lose file explorer' })
    keymap.set('n', '<leader>nr', '<cmd>NvimTreeRefresh<CR>', { desc = '[R]efresh file explorer' })
  end,
}
