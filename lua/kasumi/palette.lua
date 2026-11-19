local M = {}

-- The 16 terminal colors, in order
local black = '#040406'
local rose = '#dbaeaf'
local sage = '#babca7'
local blush = '#dcb2ac'
local aqua = '#9cbeba'
local mauve = '#ccb6bf'
local jade = '#75a894'
local grey = '#818783'
local charcoal = '#1e1d24'
local rose_light = '#d7bebd'
local cream = '#dbd4c9'
local peach = '#dbbfaf'
local mist = '#b3c2c9'
local lavender = '#cac1c7'
local sage_light = '#b5c4b8'
local silver = '#d3cdca'

-- Match the terminal background
local ink = '#111015'

-- Derive from the background
local ink_darker = '#0d0c11'
local ink_popup = '#17161c'
local ink_selection = '#2a2931'

M.background = ink
M.background_panel = ink_darker -- statusline and sidebars
M.background_popup = ink_popup -- floating windows and menus
M.background_cursorline = charcoal
M.background_selection = ink_selection

M.foreground = silver
M.foreground_muted = grey -- comments and inactive text
M.border = charcoal

M.rose = rose
M.sage = sage
M.blush = blush
M.aqua = aqua
M.mauve = mauve
M.jade = jade
M.cream = cream
M.peach = peach
M.mist = mist
M.lavender = lavender

-- Lua lists start at 1, so entry n is terminal color n - 1
M.terminal_colors = {
	black,
	rose,
	sage,
	blush,
	aqua,
	mauve,
	jade,
	grey,
	charcoal,
	rose_light,
	cream,
	peach,
	mist,
	lavender,
	sage_light,
	silver,
}

return M
