-- WezTerm colors for kasumi.nvim
-- Copy this file next to wezterm.lua, then add to your config:
--   config.colors = require('kasumi')
-- Or use extras/wezterm/kasumi.toml as a color scheme instead.
local M = {}

M.foreground = '#d3cdca'
M.background = '#181818'
M.cursor_bg = '#d7bebd'
M.cursor_fg = '#181818'
M.cursor_border = '#d7bebd'
M.selection_fg = '#d3cdca'
M.selection_bg = '#2c2c2c'
M.scrollbar_thumb = '#2c2c2c'
M.split = '#1e1d24'

M.ansi = {
	'#040406',
	'#dbaeaf',
	'#babca7',
	'#dcb2ac',
	'#9cbeba',
	'#ccb6bf',
	'#75a894',
	'#818783',
}
M.brights = {
	'#1e1d24',
	'#d7bebd',
	'#dbd4c9',
	'#dbbfaf',
	'#b3c2c9',
	'#cac1c7',
	'#b5c4b8',
	'#d3cdca',
}

-- The tab bar follows the Neovim statusline, with a rose bar for the active tab
M.tab_bar = {
	background = '#121212',
	active_tab = { bg_color = '#dbaeaf', fg_color = '#181818' },
	inactive_tab = { bg_color = '#121212', fg_color = '#818783' },
	inactive_tab_hover = { bg_color = '#1e1d24', fg_color = '#d3cdca' },
	new_tab = { bg_color = '#121212', fg_color = '#818783' },
	new_tab_hover = { bg_color = '#1e1d24', fg_color = '#d3cdca' },
}

return M
