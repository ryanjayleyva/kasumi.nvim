-- mason.nvim highlight groups
local M = {}

function M.get(palette)
	return {
		-- Backdrop behind the window
		{ 'MasonBackdrop', { bg = palette.background_panel } },

		-- Window headers
		{
			'MasonHeader',
			{ fg = palette.background, bg = palette.rose, bold = true },
		},
		{
			'MasonHeaderSecondary',
			{ fg = palette.background, bg = palette.aqua, bold = true },
		},

		-- Primary accent, also used by MasonLink
		{ 'MasonHighlight', { fg = palette.aqua } },
		{ 'MasonHighlightBlock', { fg = palette.background, bg = palette.aqua } },
		{
			'MasonHighlightBlockBold',
			{ fg = palette.background, bg = palette.aqua, bold = true },
		},

		-- Secondary accent
		{ 'MasonHighlightSecondary', { fg = palette.peach } },
		{
			'MasonHighlightBlockSecondary',
			{ fg = palette.background, bg = palette.peach },
		},
		{
			'MasonHighlightBlockBoldSecondary',
			{ fg = palette.background, bg = palette.peach, bold = true },
		},

		-- Muted text, such as versions and descriptions
		{ 'MasonMuted', { fg = palette.foreground_muted } },
		{
			'MasonMutedBlock',
			{ fg = palette.background, bg = palette.foreground_muted },
		},
		{
			'MasonMutedBlockBold',
			{ fg = palette.background, bg = palette.foreground_muted, bold = true },
		},
	}
end

return M
