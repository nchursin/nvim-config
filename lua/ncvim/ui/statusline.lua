ncvim.plugin({
  'nvim-lualine/lualine.nvim',
  requires = {
    {
      'kyazdani42/nvim-web-devicons',
      opt = true,
    }
  },
  config = function()
    function basename(str)
      local name = string.gsub(str, "(.*/)(.*)", "%2")
      return name
    end

    function get_cwd_basename()
      return '󰙅 ' .. basename(vim.fn.getcwd())
    end

    require('lualine').setup({
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { get_cwd_basename, 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
    })
  end
})
