-- Define nvim-treesitter-context groups
local M = {}

function M.get(palette, _options)
	return {
		-- Stay opaque, even when transparent, so scrolling code does not show through
		{
			'TreesitterContext',
			{ fg = palette.foreground, bg = palette.background },
		},
		{ 'TreesitterContextLineNumber', { fg = palette.rose_light } },
		-- Hide the separator line by drawing it in the background color
		{ 'TreesitterContextSeparator', { fg = palette.background } },
	}
end

return M
