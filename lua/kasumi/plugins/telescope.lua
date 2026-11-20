-- telescope.nvim highlight groups
local M = {}

function M.get(palette)
	return {
		-- The picker uses the float colors so it stands out from the editor
		{ 'TelescopeNormal', { link = 'NormalFloat' } },
		{ 'TelescopeBorder', { link = 'FloatBorder' } },
		{ 'TelescopeTitle', { link = 'FloatTitle' } },

		-- Same as nvim-cmp, so matched characters look the same in both
		{ 'TelescopeMatching', { fg = palette.aqua, bold = true } },

		{ 'TelescopePromptPrefix', { fg = palette.rose } },
		{
			'TelescopeSelectionCaret',
			{
				fg = palette.rose,
				bg = palette.background_selection,
			},
		},

		-- NonText is too dark to read for these
		{ 'TelescopePromptCounter', { fg = palette.foreground_muted } },
		{ 'TelescopePreviewHyphen', { fg = palette.foreground_muted } },
		{ 'TelescopeResultsDiffUntracked', { link = 'Added' } },
	}
end

return M
