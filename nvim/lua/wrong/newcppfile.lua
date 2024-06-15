
local newcppfile = vim.api.nvim_create_augroup('newcppfile', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufNewFile", {
	group = newcppfile,
	pattern = '*.cpp',
	callback = function(args)
		local cname = vim.fn.expand('%:t1'):match('(.+).cpp')
		vim.api.nvim_paste('#include \"' .. cname .. '.hpp\"\n\n', true, -1)
		vim.api.nvim_paste(cname .. '::' .. cname .. '(){\n}\n', true, -1)
		vim.api.nvim_paste(cname .. '::' .. cname .. '(const ' .. cname .. '& copy){\n}\n', true, -1)
		vim.api.nvim_paste(cname .. '& ' .. cname .. '::operator=(const ' .. cname .. '& copy){\n}\n', true, -1)
		vim.api.nvim_paste(cname .. '::~' .. cname .. '(){\n}\n', true, -1)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('kkkkkkkkkkkkk', 'v:true', 'v:false', 'v:true'), 'm', 'v:true')
	end
})
