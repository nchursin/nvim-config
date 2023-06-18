local files = vim.fn.readdir(
  vim.fn.stdpath('config') .. '/lua/custom'
)

for _, file in ipairs(files) do
  if '.gitkeep' ~= file then
    require('custom.' .. file:gsub('%.lua$', ''))
  end
end
