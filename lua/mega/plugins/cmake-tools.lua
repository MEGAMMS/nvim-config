return {
  'Civitasv/cmake-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,
  init = function()
    local loaded = false
    local function check()
      local cwd = vim.uv.cwd()
      if vim.fn.filereadable(cwd .. '/CMakeLists.txt') == 1 then
        require('lazy').load { plugins = { 'cmake-tools.nvim' } }
        loaded = true
      end
    end
    check()
    vim.api.nvim_create_autocmd('DirChanged', {
      callback = function()
        if not loaded then
          check()
        end
      end,
    })
  end,
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
}
