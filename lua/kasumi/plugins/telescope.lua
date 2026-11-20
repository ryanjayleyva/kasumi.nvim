-- Define telescope.nvim groups
local M = {}

function M.get(palette)
	return {
		-- Paint the picker like a float so it stands out from the editor
		{ 'TelescopeNormal', { link = 'NormalFloat' } },
		{ 'TelescopeBorder', { link = 'FloatBorder' } },
		{ 'TelescopeTitle', { link = 'FloatTitle' } },

		-- Match nvim-cmp so matched characters look the same in both
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
