return {
  'pocco81/auto-save.nvim',
  opts = {
    enabled = true, -- Enable autosave by default
    execution_message = {
      message = function()
        return ''
      end, -- Disable save notifications
    },
    events = { 'InsertLeave', 'TextChanged' }, -- Save when leaving insert mode or on text changes
    conditions = {
      exists = true,
      filename_is_not = {},
      filetype_is_not = { 'markdown' }, -- Example: Skip autosaving markdown files
      modifiable = true,
    },
    write_all_buffers = true, -- Save all buffers
  },
  config = function(_, opts)
    -- Set up the plugin with the given options
    require('auto-save').setup(opts)

    -- Map <leader>tas to toggle auto-save
    vim.keymap.set('n', '<leader>tas', ':ASToggle<CR>', { desc = '[T]oggle [A]uto-[S]ave' })
  end,
}
