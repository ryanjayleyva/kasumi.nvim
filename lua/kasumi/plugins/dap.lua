-- Define nvim-dap and nvim-dap-ui groups
local M = {}

function M.get(palette, _options)
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

		-- Match the other floating windows
		{ 'DapUIFloatBorder', { link = 'FloatBorder' } },
		-- Mark the stop button as destructive
		{ 'DapUIStop', { fg = palette.rose } },
	}
end

return M
