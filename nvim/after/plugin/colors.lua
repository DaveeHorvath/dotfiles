function ReColor(color)
	color = color or 'cyberdream'
	require('cyberdream').setup({
		transparent = true,
		hide_fillchars = true,
		borderless_telescope = false,
	})
	vim.cmd.colorscheme(color)
end

ReColor()
