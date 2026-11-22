-- WezTerm: a Lua module and a TOML color scheme
local shared = require('extras.shared')
local palette = shared.palette
local theme = shared.theme

-- Entries 1-8 are the normal colors, 9-16 the bright ones
local ansi_colors = { unpack(shared.terminal_colors, 1, 8) }
local bright_colors = { unpack(shared.terminal_colors, 9, 16) }

local tab_bar_background = palette.background_panel

-- Tab bar states, in the order they are written
local tab_styles = {
	{
		name = 'active_tab',
		background = palette.rose,
		foreground = palette.background,
	},
	{
		name = 'inactive_tab',
		background = palette.background_panel,
		foreground = palette.foreground_muted,
	},
	{
		name = 'inactive_tab_hover',
		background = palette.background_subtle,
		foreground = palette.foreground,
	},
	{
		name = 'new_tab',
		background = palette.background_panel,
		foreground = palette.foreground_muted,
	},
	{
		name = 'new_tab_hover',
		background = palette.background_subtle,
		foreground = palette.foreground,
	},
}

local function build_lua_module()
	local lines = {
		'-- WezTerm colors for kasumi.nvim',
		'-- ' .. shared.generated_note,
		'-- Copy this file next to wezterm.lua, then add to your config:',
		"--   config.colors = require('kasumi')",
		'-- Or use extras/wezterm/kasumi.toml as a color scheme instead.',
		'local M = {}',
		'',
		("M.foreground = '%s'"):format(theme.foreground),
		("M.background = '%s'"):format(theme.background),
		("M.cursor_bg = '%s'"):format(theme.cursor),
		("M.cursor_fg = '%s'"):format(theme.background),
		("M.cursor_border = '%s'"):format(theme.cursor),
		("M.selection_fg = '%s'"):format(theme.selection_foreground),
		("M.selection_bg = '%s'"):format(theme.selection_background),
		("M.scrollbar_thumb = '%s'"):format(theme.selection_background),
		("M.split = '%s'"):format(theme.split),
		'',
		'M.ansi = {',
	}
	vim.list_extend(lines, shared.quoted_hex_lines(ansi_colors, '\t', "'"))
	table.insert(lines, '}')
	table.insert(lines, 'M.brights = {')
	vim.list_extend(lines, shared.quoted_hex_lines(bright_colors, '\t', "'"))

	vim.list_extend(lines, {
		'}',
		'',
		'-- The tab bar follows the Neovim statusline, with a rose bar for the active tab',
		'M.tab_bar = {',
		("\tbackground = '%s',"):format(tab_bar_background),
	})
	for _, tab in ipairs(tab_styles) do
		table.insert(
			lines,
			("\t%s = { bg_color = '%s', fg_color = '%s' },"):format(
				tab.name,
				tab.background,
				tab.foreground
			)
		)
	end

	vim.list_extend(lines, { '}', '', 'return M' })
	return shared.join_lines(lines)
end

local function build_toml_scheme()
	local lines = {
		'# WezTerm color scheme for kasumi.nvim',
		'# ' .. shared.generated_note,
		'# Copy this file to ~/.config/wezterm/colors/kasumi.toml, then add to your config:',
		'#   config.color_scheme = "kasumi"',
		'# Add config.color_scheme_dirs = { wezterm.config_dir .. "/colors" } if WezTerm does not find it.',
		'',
		'[metadata]',
		'name = "kasumi"',
		'',
		'[colors]',
		('foreground = "%s"'):format(theme.foreground),
		('background = "%s"'):format(theme.background),
		('cursor_bg = "%s"'):format(theme.cursor),
		('cursor_fg = "%s"'):format(theme.background),
		('cursor_border = "%s"'):format(theme.cursor),
		('selection_fg = "%s"'):format(theme.selection_foreground),
		('selection_bg = "%s"'):format(theme.selection_background),
		('scrollbar_thumb = "%s"'):format(theme.selection_background),
		('split = "%s"'):format(theme.split),
		'ansi = [',
	}
	vim.list_extend(lines, shared.quoted_hex_lines(ansi_colors, '  ', '"'))
	table.insert(lines, ']')
	table.insert(lines, 'brights = [')
	vim.list_extend(lines, shared.quoted_hex_lines(bright_colors, '  ', '"'))

	vim.list_extend(lines, {
		']',
		'',
		'[colors.tab_bar]',
		('background = "%s"'):format(tab_bar_background),
	})
	for _, tab in ipairs(tab_styles) do
		vim.list_extend(lines, {
			'',
			('[colors.tab_bar.%s]'):format(tab.name),
			('bg_color = "%s"'):format(tab.background),
			('fg_color = "%s"'):format(tab.foreground),
		})
	end

	return shared.join_lines(lines)
end

return {
	['extras/wezterm/kasumi.lua'] = build_lua_module(),
	['extras/wezterm/kasumi.toml'] = build_toml_scheme(),
}
