return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
      {
        '<leader>tfs',
        function()
          -- Toggle format on save
          vim.g.conform_format_on_save = not vim.g.conform_format_on_save
          print('Format on save ' .. (vim.g.conform_format_on_save and 'enabled' or 'disabled'))
        end,
        mode = '',
        desc = '[T]oggle [F]ormat on [S]ave',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        if not vim.g.conform_format_on_save then
          return nil -- Disable format on save if the toggle is off
        end
        -- Format options
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
        php = { 'pint', 'php_cs_fixer' },
        xml = { 'xmlformatter' },
      },
    },
    config = function(_, opts)
      vim.g.conform_format_on_save = false -- Default to format on save disabled
      require('conform').setup(opts)
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
