-- Define gitsigns.nvim groups
local M = {}

function M.get(palette, _options)
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
		-- Mark changed words instead of inverting the cursor colors
		{ 'GitSignsAddInline', { fg = palette.background, bg = palette.jade } },
		{ 'GitSignsChangeInline', { fg = palette.background, bg = palette.aqua } },
		{ 'GitSignsDeleteInline', { fg = palette.background, bg = palette.rose } },
	}
end

return M
