local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd

local function get_path(str,sep)
    sep=sep or'/'
    return str:match("(.*"..sep..")")
end

local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

autocmd(
	'VimEnter',
	{
		pattern = '*',
		callback = function(ev)
			local opened = ev.file
			local folder_opened = string.find(opened, 'NERD_tree')
			if folder_opened then
				local folder = get_path(opened)
				local exist = file_exists(folder .. '.env.lua')
				if exist then
					cmd('source ' .. folder .. '.env.lua')
				end
			end
		end,
	}
)

autocmd(
    'BufWritePre',
    {
        pattern = '*',
        command = ':%s/\\s\\+$//e'
    }
)

-- local function reload_plugins()
    -- cmd':Reload'
    -- cmd':Restart'
    -- cmd':PackerCompile'
    -- cmd':PackerSync'
-- end

-- autocmd(
--     'BufWritePost',
--     {
--         pattern = '*/plugins.lua',
--         callback = reload_plugins,
--     }
-- )

