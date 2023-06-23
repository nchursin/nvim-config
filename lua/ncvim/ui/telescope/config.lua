return function()
  require('telescope').setup({
    defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-h>"] = "which_key"
        },
        n = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-h>"] = "which_key",
          ["dd"] = "delete_buffer",
        }
      }
    },
  })

  local conf = require("telescope.config").values
  local finders = require "telescope.finders"
  local Path = require('plenary.path')
  local make_entry = require "telescope.make_entry"
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"

  local session_manager_utils = require('session_manager.utils')
  local session_manager = require('session_manager')

  ncvim.pickers.sessions = function()
    local sessions = session_manager_utils.get_sessions()

    require('telescope.pickers').new({
      prompt_title = "Load Session",
      finder = finders.new_table {
        results = sessions,
        -- fn = session_manager_utils.get_sessions,
        entry_maker = function(session_info)
          return make_entry.set_default_entry_mt({
            value = session_info.filename,
            content = Path.expand(session_info.dir),
            ordinal = Path.expand(session_info.dir),
            display = Path.expand(session_info.dir),
          }, {})
        end,
      },
      sorter = conf.generic_sorter({}),
      push_cursor_on_edit = true,
      push_tagstack_on_edit = true,

      attach_mappings = function(prompt_bufnr, _)
        actions.select_default:replace(
          function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            session_manager.autosave_session()
            session_manager_utils.load_session(selection.value, true)
          end
        )
        actions.delete_buffer:replace(
          function()
            local current_picker = action_state.get_current_picker(prompt_bufnr)
            current_picker:delete_selection(function(selection)
              Path:new(selection.value):rm()
            end)
          end
        )
        return true
      end,

    }, {}):find()
  end
  require('telescope').load_extension('dap')
  -- require('telescope').load_extension('ui-select')
end
