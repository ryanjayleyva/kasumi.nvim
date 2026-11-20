-- nvim-dap and nvim-dap-ui highlight groups
local M = {}

function M.get(palette)
	return {
		-- nvim-dap draws the stopped line with debugPC, which is empty by default
		{ 'debugPC', { bg = palette.background_selection } },

		-- Sign groups. nvim-dap does not use them until a sign definition
		-- sets texthl, for example vim.fn.sign_define('DapBreakpoint', {
		-- texthl = 'DapBreakpoint' })
		{ 'DapBreakpoint', { fg = palette.rose } },
		{ 'DapBreakpointCondition', { fg = palette.peach } },
		{ 'DapBreakpointRejected', { fg = palette.foreground_muted } },
		{ 'DapLogPoint', { fg = palette.aqua } },
		{ 'DapStopped', { fg = palette.jade } },

		-- Same as the other floating windows
		{ 'DapUIFloatBorder', { link = 'FloatBorder' } },
		-- The stop button is rose, as a destructive action
		{ 'DapUIStop', { fg = palette.rose } },
	}
end

return M
