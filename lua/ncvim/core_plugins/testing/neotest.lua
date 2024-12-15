ncvim.plugin({
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "fredrikaverpil/neotest-golang", version = "*"
    },
  },
  -- opts = {
  --   adapters = {
  --     require("neotest-golang"),     -- Registration
  --   },
  -- }
  -- config = function()
  --   require("neotest").setup({
  --     adapters = {
  --       require("neotest-golang")({
  --         runner = "gotestsum"
  --       }),
  --     },
  --   })
  -- end,

  opts = function(_, opts)
    opts.adapters = opts.adapters or {}
    opts.adapters["neotest-golang"] = {
      runner = "gotestsum",
      gotestsum_args = {
        '--format=testdox',
      },
      -- go_test_args = {
      --   "-v",
      --   "-race",
      --   "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
      -- },
    }
  end,
  config = function(_, opts)
    if opts.adapters then
      local adapters = {}
      for name, config in pairs(opts.adapters or {}) do
        if type(name) == "number" then
          if type(config) == "string" then
            config = require(config)
          end
          adapters[#adapters + 1] = config
        elseif config ~= false then
          local adapter = require(name)
          if type(config) == "table" and not vim.tbl_isempty(config) then
            local meta = getmetatable(adapter)
            if adapter.setup then
              adapter.setup(config)
            elseif adapter.adapter then
              adapter.adapter(config)
              adapter = adapter.adapter
            elseif meta and meta.__call then
              adapter(config)
            else
              error("Adapter " .. name .. " does not support setup")
            end
          end
          adapters[#adapters + 1] = adapter
        end
      end
      opts.adapters = adapters
    end

    require("neotest").setup(opts)
  end,
})
