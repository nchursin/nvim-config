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

    local get_tabpage_head_buffer = function(tabpage)
      local has_buffer = tabpage.focused ~= nil
      if not has_buffer then
        return nil
      end

      local success, buff_nr = pcall(vim.api.nvim_win_get_buf, tabpage.focused.number)
      if success == false then
        print("tab err: " .. buff_nr)
        return nil
      end
      local buf = buffers.get_buffer(buff_nr)

      return buf
    end

    highlight = {
      active = {
        fg = function() return get_hex('WarningMsg', 'fg') end,
        bg = function() return get_hex('Visual', 'bg') end,
      },
      inactive = {
        fg = function() return get_hex('CursorLine', 'fg') end,
        bg = function() return get_hex('CursorLine', 'bg') end,
      },
    }

    -- print('highlight inactive bg: ' .. highlight.inactive.bg)

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
          -- fg = function(tabpage)
          --   local buffer = get_tabpage_head_buffer(tabpage)
          --   if buffer == nil then
          --     return green
          --   end
          --   return
          --       buffer.is_modified and yellow or green
          -- end
        },
      },

      sidebar = {
        filetype = { 'NvimTree', 'neo-tree' },
        components = {
          {
            text = function(buf)
              return "Files"
            end,
            fg = highlight.inactive.fg,
            bg = function() return get_hex('NvimTreeNormal', 'bg') end,
            bold = true,
          },
        }
      },

      tabs = {
        placement = "left",
        ---@type Component[]
        components = {
          {
            bg = highlight.inactive.bg,
            fg = highlight.inactive.fg,
            text = function(tabpage)
              if tabpage.number == 1 then
                return ' '
              end
              return '｜'
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
          },
          {
            bg = highlight.inactive.bg,
            fg = highlight.inactive.fg,
            text = function(tabpage)
              return tabpage.is_last and '｜' or ''
            end,
          },
        }
      },
    })

    -- print("bg >> " .. highlight.inactive.bg)
    -- vim.cmd("hi TabLineFill guibg=" .. highlight.inactive.bg)

    -- vim.cmd("hi TabLineFill guibg=" .. highlight.inactive.bg)
  end
}
