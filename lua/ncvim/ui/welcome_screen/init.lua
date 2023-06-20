ncvim.plugin({
  'goolord/alpha-nvim',
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    dashboard.section.header.val = {
      [[                                                                                          ]],
      [[                                        ▒                                                 ]],
      [[                                       ▒▓      ▒▒  ▒                                      ]],
      [[                                       ▓▓      ▓▒  ▒▓                                     ]],
      [[                              ▒▓       ▒▓      ▓▒  ▒▓▒                                    ]],
      [[                              ▓▒        ▒ ▒    ▓▓▒▒▓▓▒  ▒▓                                ]],
      [[                              ▓      ▓    ▓▓    ▓▓▓▓▒   ▒▓▒                               ]],
      [[                                 ▒   ▓▓   ▓▓    ▒▓▓▒     ▓▒                               ]],
      [[                            ▒    ▓▒  ▒▓  ▓▓▒    ▒▓▒      ▓▒  ▒▒                           ]],
      [[                           ▒▓▒   ▓▒  ▓▓ ▒▓▓▒ ▒  ▓▓      ▒    ▓▓                           ]],
      [[                           ▓▓▒   ▓▓▓▓▓▓  ▓▓▒ ▓▓▓▓▓   ▒       ▓▓▓                          ]],
      [[                          ▓▓▓     ▓▓▓▓       ▓▓▓▒▓▒ ▒▓▓  ▒▒  ▒▓▓▓                         ]],
      [[                         ▒▓▓▓  ▓   ▓▓▓      ▒▓▓▒ ▓▓▓▓▓   ▓▓  ▒▓▓▓▒                        ]],
      [[                         ▓▓▓▓▒▓▓   ▓▓▓▒     ▓▓▓▒  ▓▓▓    ▓▓▓▒▓▓▓▓▓                        ]],
      [[                         ▒▓▓▓▓▓▒   ▓▓▓▓▒    ▒▓▓▓  ▒▓     ▒▓▓▒ ▓▓▓▒                        ]],
      [[                          ▓▓▓▓ ▒▓▒▓▓▓▓▓▓▓▓▓  ▒▒   ▒▓     ▓▓▓  ▒▓▓                         ]],
      [[                           ▓▓▒  ▓▓▓▒▓▓▒ ▓▓        ▓▓▒   ▒▓▓▓▒  ▓                          ]],
      [[                            ▒   ▒▓▓  ▓▓          ▓▓▓▓  ▒▓▓▒▓▓                             ]],
      [[                      ▒             ▒▓▓▒         ▓▓▓▒  ▒▓▓▒         ▒                     ]],
      [[                     ▒▓▒▓  ▒         ▓▓▓         ▒▒     ▓▓     ▒  ▓ ▓                     ]],
      [[                      ▒▓▓▒ ▓          ▒                        ▓ ▓▓▓▒                     ]],
      [[                     ▒▓▓▓▒ ▓                                  ▒▓ ▓▓▓▓                     ]],
      [[                     ▒▓▓▓▒ ▓                                  ▒▓ ▓▓▓▓                     ]],
      [[                     ▒▓▓▓▓   ▒▓▒                           ▓▓▒   ▓▓▓▓                     ]],
      [[                      ▓▓▓▓▓▒  ▒▒▓▓▒                     ▒▓▒▒▒  ▒▓▓▓▓▓                     ]],
      [[                       ▓▓▓▓▓▓▒ ▒▓▓▓▓▒                 ▒▓▓▓▓▒ ▒▓▓▓▓▓▓                      ]],
      [[                        ▒▓▓▓▓▓▓  ▓▓▓▓▓▒             ▒▓▓▓▓▒  ▓▓▓▓▓▓▒                       ]],
      [[                          ▒▓▓▓▓▓▒ ▒▓▓▓▓▓▒         ▒▓▓▓▓▓  ▓▓▓▓▓▓▒                         ]],
      [[                            ▓▓▓▓▓▓ ▒▓▓▓▓▓▓      ▒▓▓▓▓▓▓▒ ▓▓▓▓▓▒                           ]],
      [[                             ▒▓▓▓▓▓▓▓▓▓▓▓▓▓     ▓▓▓▓▓▓▓▓▓▓▓▓▓                             ]],
      [[                               ▒▓▓▓▓▓▓▓▓▓▓▓    ▒▓▓▓▓▓▓▓▓▓▓▓▒                              ]],
      [[                                 ▒▓▓▓▓▓▓▓▓▓    ▒▓▓▓▓▓▓▓▓▓▒                                ]],
      [[                                  ▒▓▓▓▓▓▓▓▓▒   ▒▓▓▓▓▓▓▓▓▒                                 ]],
      [[                                  ▒▓▓▓▓▓▓▓▓▒   ▒▓▓▓▓▓▓▓▓▒                                 ]],
      [[                                  ▒████████▒   ▒████████▒                                 ]],
      [[                                  ▒████████▒   ▒████████▒                                 ]],
      [[                                  ▒████████▒   ▒████████▒                                 ]],
      [[                                  ▒████████▒   ▒████████▒                                 ]],
      [[                                  ▒████████▒   ▒████████▒                                 ]],
      [[                                  ▒████████▒   ▒████████                                  ]],
      [[                                   ▓▓▓▓▓▓▓▓     ▓▓▓▓▓▓▓▓                                  ]],
      [[                                                                                          ]],
    }

    local session_manager_config = require('session_manager.config')
    local cwd = vim.loop.cwd()
    local current_dir_session = session_manager_config.dir_to_session_filename(cwd)

    local buttons = {}
    table.insert(buttons, dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"))
    table.insert(buttons, dashboard.button("f", "󰉋 Go to folder", ":lua ncvim.filetree.focus()<CR>:2q<CR>"))
    if current_dir_session:exists() then
      table.insert(buttons,
        dashboard.button("l", "󰦖 Load Current Dir Session", ":SessionManager load_current_dir_session<CR>"))
    end
    table.insert(buttons, dashboard.button("s", "󱣹 Sessions", ":SessionManager load_session<CR>"))
    table.insert(buttons, dashboard.button("m", " LSP/Linters/Formatters", ":Mason<CR>"))
    table.insert(buttons, dashboard.button("p", " Packages Update (PackerSync)", ":PackerSync<CR>"))
    table.insert(buttons,
      dashboard.button(",", "󰒓 NcVim Config Folder",
        ":lua ncvim.config.open()<CR>:lua ncvim.filetree.focus()<CR>:2q<CR>"))
    table.insert(buttons, dashboard.button("q", "󰩈 Quit", ":qa<CR>"))

    dashboard.section.buttons.val = buttons

    dashboard.config.opts.noautocmd = true
    alpha.setup(dashboard.config)
    -- require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
  end
})
