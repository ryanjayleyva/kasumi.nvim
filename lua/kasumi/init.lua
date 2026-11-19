local M = {}

local highlight_modules = { 'highlights', 'syntax', 'plugins' }

M.options = { transparent = false }

-- Clear stale groups so nothing leaks in from the previous colorscheme
local function reset_highlights()
	vim.cmd('highlight clear')
	if vim.fn.exists('syntax_on') == 1 then
		vim.cmd('syntax reset')
	end
end

local function collect_highlight_groups(palette)
	local groups = {}
	for _, module_name in ipairs(highlight_modules) do
		local module = require('kasumi.' .. module_name)
		vim.list_extend(groups, module.get(palette, M.options))
	end
	return groups
end

local function apply_highlight_groups(groups)
	for _, group in ipairs(groups) do
		local name, definition = group[1], group[2]
		vim.api.nvim_set_hl(0, name, definition)
	end
end

local function set_terminal_colors(colors)
	for index, color in ipairs(colors) do
		vim.g['terminal_color_' .. (index - 1)] = color
	end
end

function M.setup(user_options)
	M.options = vim.tbl_deep_extend('force', M.options, user_options or {})
	-- Reload so new options apply without another :colorscheme.
	if vim.g.colors_name == 'kasumi' then
		M.load()
	end
end

function M.load()
	reset_highlights()
	vim.o.termguicolors = true
	vim.g.colors_name = 'kasumi'

	local palette = require('kasumi.palette')
	apply_highlight_groups(collect_highlight_groups(palette))
	set_terminal_colors(palette.terminal_colors)
end

return M
