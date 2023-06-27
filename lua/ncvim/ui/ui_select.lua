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
                  min_height = { 1, 0 },
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
    command = function()
      require "popui.diagnostics-navigator" ()
    end
  }
})
