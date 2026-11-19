-- Define nvim-treesitter-context groups
local M = {}

function M.get(palette, _options)
	return {
		-- The border color is too close to the context background to show
		{ 'TreesitterContextSeparator', { fg = palette.foreground_muted } },
	}
end

return M
