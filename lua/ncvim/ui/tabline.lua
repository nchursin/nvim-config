-- ncvim.plugin({
--   'akinsho/bufferline.nvim',
--   requires = 'nvim-tree/nvim-web-devicons',
--   config = function()
--     vim.opt.termguicolors = true
--     require("bufferline").setup {
--       options = {
--         mode = "tabs", -- set to "tabs" to only show tabpages instead
--         show_buffer_close_icons = false,
--         show_close_icon = false,
--         always_show_bufferline = false,
--       }
--     }
--   end,
-- })

function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then k = '"' .. k .. '"' end
      s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

ncvim.plugin {
  'willothy/nvim-cokeline',

  dependencies = {
    "nvim-lua/plenary.nvim",       -- Required for v0.4.0+
    "nvim-tree/nvim-web-devicons", -- If you want devicons
    "stevearc/resession.nvim"      -- Optional, for persistent history
  },

  config = function()
    local buffersApi = require('cokeline.buffers')
    local tabs = require('cokeline.tabs')

    local get_hex = require('cokeline.hlgroups').get_hl_attr

    local get_tabpage_head_buffer = function(tabpage)
      tabs.fetch_tabs()
      tabpage = tabs.get_tabpage(tabpage.number)
      if tabpage == nil then
        return nil
      end
      local has_buffer = tabpage.focused ~= nil
      if not has_buffer then
        return nil
      end

      local success, buff_nr = pcall(vim.api.nvim_win_get_buf, tabpage.focused.number)
      if success == false then
        -- print("tab err: " .. buff_nr)
        return nil
      end
      local buf = buffersApi.get_buffer(buff_nr)

      return buf
    end

    local highlight = {
      active = {
        fg = function() return get_hex('Folded', 'fg') end,
        bg = function() return get_hex('Visual', 'bg') end,
        error = {
          fg = function() return get_hex('ErrorMsg', 'fg') end,
        },
        warning = {
          fg = function() return get_hex('WarningMsg', 'fg') end,
        },
      },
      inactive = {
        fg = function() return get_hex('CursorLine', 'fg') end,
        bg = function() return get_hex('CursorLine', 'bg') end,
        error = {
          fg = function() return get_hex('Substitute', 'fg') end,
        },
        warning = {
          fg = function() return get_hex('WinBar', 'fg') end,
        },
      },

      error = {
        fg = function(buffer)
          if buffer.is_focused then
            return get_hex('ErrorMsg', 'fg')
          else
            return get_hex('Substitute', 'fg')
          end
        end
      },

      warning = {
        fg = function(buffer)
          if buffer.is_focused then
            return get_hex('WarningMsg', 'fg')
          else
            return get_hex('WinBar', 'fg')
          end
        end
      },
    }

    local get_window_buffer = function(window)
      local success, buff_nr = pcall(vim.api.nvim_win_get_buf, window.number)
      if success == false then
        -- print("tab err: " .. buff_nr)
        return nil
      end
      return buffersApi.get_buffer(buff_nr)
    end

    local get_tab_buffers = function(tabpage)
      return ncvim.utils.filter(
        function(v)
          return v ~= nil
        end,
        ncvim.utils.map(
          get_window_buffer,
          tabpage.windows
        )
      )
    end

    local buffer_has_errors = function(buffer)
      if buffer == nil or buffer.diagnostics == nil or buffer.diagnostics.errors == nil then
        return false
      end
      return 0 < buffer.diagnostics.errors
    end

    local buffer_has_warnings = function(buffer)
      if buffer == nil or buffer.diagnostics == nil or buffer.diagnostics.warnings == nil then
        return false
      end
      return 0 < buffer.diagnostics.warnings
    end

    local tab_errors_num = function(tabpage)
      local buffers = get_tab_buffers(tabpage)

      if buffers == nil then
        return 0
      end

      local total_errs = 0
      for _, buff in pairs(buffers) do
        if buff.diagnostics == nil or buff.diagnostics.errors == nil then
          goto continue
        end
        total_errs = total_errs + buff.diagnostics.errors
        ::continue::
      end

      return total_errs
    end

    local tab_has_errors = function(tabpage)
      return 0 < tab_errors_num(tabpage)
    end

    require('cokeline').setup({
      default_hl = {
        fg = function(tabpage)
          return
              tabpage.is_active and
              highlight.active.fg()
              or highlight.inactive.fg()
        end,
        bg = function(tabpage)
          return
              tabpage.is_active and
              highlight.active.bg()
              or highlight.inactive.bg()
        end,
        sp = highlight.inactive.bg,
      },

      fill_hl = 'CursorLine',

      components = {},

      rhs = {
        {
          fg = highlight.inactive.fg,
          bg = highlight.inactive.bg,
          text = function()
            local now = os.time()
            return os.date('%d.%m.%y %H:%M:%S', now)
          end,
        },
      },

      -- sidebar = {
      --   filetype = { 'NvimTree', 'neo-tree' },
      --   components = {
      --     {
      --       text = function(buf)
      --         return "Files"
      --       end,
      --       fg = highlight.inactive.fg,
      --       bg = function() return get_hex('NvimTreeNormal', 'bg') end,
      --       bold = true,
      --     },
      --   }
      -- },

      tabs = {
        placement = "left",
        ---@type Component[]
        components = {
          {
            text = function(tabpage)
              return ' '
            end,
          },
          {
            text = function(tabpage)
              local buffer = get_tabpage_head_buffer(tabpage)
              if buffer == nil then
                return ''
              end
              if buffer.devicon == nil then
                return ''
              end
              return buffer.devicon.icon .. ' '
            end,
            fg = function(tabpage)
              local buffer = get_tabpage_head_buffer(tabpage)
              if buffer == nil then
                return ''
              end
              if buffer.devicon == nil then
                return ''
              end
              return buffer.devicon.color
            end,
          },
          {
            text = function(tabpage)
              return tabpage.index .. ': '
            end,
            bold = function(tabpage)
              return tabpage.is_active
            end,
          },
          {
            text = function(tabpage)
              local buffer = get_tabpage_head_buffer(tabpage)
              if buffer == nil then
                return ''
              end
              return buffer.unique_prefix
            end,
            fg = get_hex('Comment', 'bg'),
            italic = true,
          },
          {
            text = function(tabpage)
              local buffer = get_tabpage_head_buffer(tabpage)
              if buffer == nil then
                return ''
              end
              return buffer.filename .. ' '
            end,
            bold = function(tabpage)
              local buffer = get_tabpage_head_buffer(tabpage)
              if buffer == nil then
                return ''
              end
              return buffer.is_focused
            end,
            fg = function(tabpage)
              local buffer = get_tabpage_head_buffer(tabpage)
              if buffer == nil then
                return ''
              end
              return
                  buffer_has_errors(buffer) and buffer.is_focused and highlight.active.error.fg()
                  or buffer_has_errors(buffer) and not buffer.is_focused and highlight.inactive.error.fg()

                  or buffer_has_warnings(buffer) and buffer.is_focused and highlight.active.warning.fg()
                  or buffer_has_warnings(buffer) and not buffer.is_focused and highlight.inactive.warning.fg()

                  or tab_has_errors(tabpage) and highlight.inactive.error.fg()

                  or buffer.is_focused and highlight.active.fg()
                  or highlight.inactive.fg()
            end
          },
          {
            text = function(tabpage)
              local buffer = get_tabpage_head_buffer(tabpage)
              if buffer == nil then
                return ''
              end
              return
                  (buffer.diagnostics.errors ~= 0 and '   ' .. buffer.diagnostics.errors)

                  or (buffer.diagnostics.warnings ~= 0 and '  ' .. buffer.diagnostics.warnings)

                  or tab_has_errors(tabpage) and '   ' .. tab_errors_num(tabpage)

                  or ''
            end,
            fg = function(tabpage)
              local buffer = get_tabpage_head_buffer(tabpage)
              if buffer == nil then
                return ''
              end
              return
                  buffer_has_errors(buffer) and buffer.is_focused and highlight.active.error.fg()
                  or buffer_has_errors(buffer) and not buffer.is_focused and highlight.inactive.error.fg()

                  or buffer_has_warnings(buffer) and buffer.is_focused and highlight.active.warning.fg()
                  or buffer_has_warnings(buffer) and not buffer.is_focused and highlight.inactive.warning.fg()

                  or tab_has_errors(tabpage) and highlight.inactive.error.fg()

                  or nil
            end,
            truncation = {
              priority = 1,
            },
          },
          {
            text = function(tabpage)
              return ' '
            end,
          },
          {
            bg = highlight.inactive.bg,
            fg = function()
              return get_hex('Directory', 'fg')
            end,
            text = function(tabpage)
              return '｜'
            end,
          },
        }
      },
    })
  end
}
