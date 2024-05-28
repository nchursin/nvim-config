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
  config = function()
    local buffers = require('cokeline.buffers')

    local get_hex = require('cokeline.hlgroups').get_hl_attr

    local green = vim.g.terminal_color_2
    local yellow = vim.g.terminal_color_3

    local get_tabpage_head_buffer = function(tabpage)
      local has_buffer = tabpage.focused ~= nil
      if not has_buffer then
        return nil
      end


      local buff_nr = vim.api.nvim_win_get_buf(tabpage.focused.number)
      local buf = buffers.get_buffer(buff_nr)

      return buf
    end

    highlight = {
      active = {
        fg = get_hex('DiffText', 'fg'),
        bg = get_hex('DiffText', 'bg'),
      },
      inactive = {
        bg = get_hex('ColorColumn', 'bg'),
        fg = get_hex('Normal', 'fg'),
      },
    }

    require('cokeline').setup({
      default_hl = {
        fg = function(tabpage)
          return
              tabpage.is_active and
              highlight.active.fg
              or highlight.inactive.fg
        end,
        bg = function(tabpage)
          return
              tabpage.is_active and
              highlight.active.bg
              or highlight.inactive.bg
        end,
      },

      components = {
      },

      tabs = {
        placement = "left",
        ---@type Component[]
        components = {
          {
            text = '｜',
            highlight = 'bg',
            fg = function(tabpage)
              local buffer = get_tabpage_head_buffer(tabpage)
              if buffer == nil then
                return green
              end
              return
                  buffer.is_modified and yellow or green
            end
          },
          {
            text = function(tabpage)
              local buffer = get_tabpage_head_buffer(tabpage)
              if buffer == nil then
                return ''
              end
              return buffer.devicon.icon .. ' '
            end,
            fg = function(tabpage)
              local buffer = get_tabpage_head_buffer(tabpage)
              if buffer == nil then
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
            fg = get_hex('Comment', 'fg'),
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
          },
          {
            highlight = 'bg',
            text = function(tabpage)
              return tabpage.is_last and '|' or ''
            end,
          },
        }
      },

    })
  end
}
