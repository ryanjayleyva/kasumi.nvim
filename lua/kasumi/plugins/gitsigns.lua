-- gitsigns.nvim highlight groups
local M = {}

function M.get(palette)
	return {
		-- Number column, line and staged variants derive from these three
		{ 'GitSignsAdd', { fg = palette.jade } },
		{ 'GitSignsChange', { fg = palette.aqua } },
		{ 'GitSignsDelete', { fg = palette.rose } },
		-- NonText is too dark to read for blame text
		{
			'GitSignsCurrentLineBlame',
			{ fg = palette.foreground_muted, italic = true },
		},
		-- Changed words get a colored block instead of inverted cursor colors
		{ 'GitSignsAddInline', { fg = palette.background, bg = palette.jade } },
		{ 'GitSignsChangeInline', { fg = palette.background, bg = palette.aqua } },
		{ 'GitSignsDeleteInline', { fg = palette.background, bg = palette.rose } },
	}
end

return M
