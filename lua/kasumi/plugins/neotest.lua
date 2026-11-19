-- Define neotest groups
local M = {}

function M.get(palette, _options)
	return {
		-- Test status
		{ 'NeotestPassed', { fg = palette.jade } },
		{ 'NeotestFailed', { fg = palette.rose } },
		{ 'NeotestRunning', { fg = palette.peach } },
		{ 'NeotestSkipped', { fg = palette.aqua } },
		{ 'NeotestWatching', { fg = palette.peach } },
		{ 'NeotestTarget', { fg = palette.rose } },

		-- Summary tree
		{ 'NeotestNamespace', { fg = palette.mauve } },
		{ 'NeotestFile', { fg = palette.aqua } },
		{ 'NeotestDir', { fg = palette.aqua } },
		{ 'NeotestAdapterName', { fg = palette.mauve, bold = true } },
		{ 'NeotestIndent', { fg = palette.border } },
		{ 'NeotestExpandMarker', { fg = palette.foreground_muted } },
		{ 'NeotestMarked', { fg = palette.peach, bold = true } },
		{ 'NeotestWinSelect', { fg = palette.aqua, bold = true } },
	}
end

return M
