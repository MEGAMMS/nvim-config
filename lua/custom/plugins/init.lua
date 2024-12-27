-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  {
    'ThePrimeagen/vim-be-good',
  },
  {
    'tpope/vim-fugitive',
  },
  {
    'Civitasv/cmake-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local osys = require 'cmake-tools.osys'
      require('cmake-tools').setup {
        cmake_build_options = { '--parallel 18' },
        cmake_build_directory = function()
          if osys.iswin32 then
            return 'build\\${variant:buildType}'
          end
          return 'build/${variant:buildType}'
        end,
        cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
        cmake_compile_commands_from_lsp = false,
      }

      -- Keymaps for CMake commands
      vim.keymap.set('n', '<leader>cr', ':CMakeRun<CR>', { desc = '[C]Make [R]un' })
      vim.keymap.set('n', '<leader>cc', ':CMakeClean<CR>', { desc = '[C]Make [C]lean' })
      vim.keymap.set('n', '<leader>cb', ':CMakeBuild<CR>', { desc = '[C]Make [B]uild' })
      vim.keymap.set('n', '<leader>cs', ':CMakeSettings<CR>', { desc = '[C]Make [S]ettings' })
      vim.keymap.set('n', '<leader>cg', ':CMakeGenerate<CR>', { desc = '[C]Make [G]enerate' })
    end,
  },
  -- require 'custom.plugins.yazi',
}
