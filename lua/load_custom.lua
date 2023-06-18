local files = vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/custom', [[v:val =~ '\.lua$']])

for _, file in ipairs(files) do
  require('custom.' .. file:gsub('%.lua$', ''))
end
