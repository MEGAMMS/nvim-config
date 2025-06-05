return {
  'oxfist/night-owl.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    require('night-owl').setup()
    vim.cmd.colorscheme 'night-owl'

    -- Set transparency
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'none' })

    -- Hide EndOfBuffer characters
    vim.opt.fillchars:append { eob = ' ' } -- Remove ~ lines
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })


    -- For common plugins
    vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })

    -- Bottom command line styling
    vim.opt.cmdheight = 0 -- Height of command line
    vim.api.nvim_set_hl(0, 'StatusLine', {
      bg = 'none',
      fg = '#7aa2f7',
      bold = true,
    })

    -- Hide bottom statusline when not needed
    vim.opt.laststatus = 0 -- Global statusline
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'none' })
  end,
}
