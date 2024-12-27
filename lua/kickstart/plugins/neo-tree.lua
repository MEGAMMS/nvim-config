-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      -- follow_current_file = true, -- Automatically focus the current file
      -- hijack_netrw_behavior = 'open_default', -- Open Neo-Tree instead of netrw
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    close_if_last_window = true, -- Close Neo-Tree if it's the last window open
  },
}
