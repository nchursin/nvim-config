ncvim.plugin({
  {
    'hood/popui.nvim',
  },
  {
    'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup({
        select = {
          get_config = function(opts)
            if opts.kind == 'codeaction' then
              return {
                backend = 'builtin',
                builtin = {
                  relative = 'cursor',
                }
              }
            end
          end
        }
      })
    end
  },
})

ncvim.add_mappings({
  {
    mode = { 'n', 'i' },
    key_string = '<C-j>',
    command = require "popui.diagnostics-navigator",
  }
})
