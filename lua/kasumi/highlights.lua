-- Define editor UI groups (Normal, StatusLine, Pmenu, ...)
-- Return a list of { group_name, definition } pairs, like the other modules
local M = {}

function M.get(palette, options)
	-- Let the terminal background show through when transparent
	local background = options.transparent and 'NONE' or palette.background

	return {
		-- Base
		{ 'Normal', { fg = palette.foreground, bg = background } },
		{ 'NormalNC', { link = 'Normal' } },
		{
			'NormalFloat',
			{ fg = palette.foreground, bg = palette.background_popup },
		},
		{ 'FloatBorder', { fg = palette.border, bg = palette.background_popup } },
		{
			'FloatTitle',
			{ fg = palette.rose, bg = palette.background_popup, bold = true },
		},
		-- Keep the blend values, which set how much of the editor shows through
		{ 'FloatShadow', { bg = palette.background_panel, blend = 80 } },
		{ 'FloatShadowThrough', { bg = palette.background_panel, blend = 100 } },
		{ 'MsgArea', { fg = palette.foreground } },
		{ 'EndOfBuffer', { fg = background } },

		-- Cursor
		{ 'Cursor', { fg = palette.background, bg = palette.foreground } },
		{ 'lCursor', { link = 'Cursor' } },
		{ 'CursorIM', { link = 'Cursor' } },
		{ 'TermCursor', { link = 'Cursor' } },
		-- Draw no cursor line or column, since Neovim's defaults would show one
		{ 'CursorLine', { bg = 'NONE' } },
		{ 'CursorColumn', { bg = 'NONE' } },
		{ 'ColorColumn', { bg = palette.background_subtle } },

		-- Gutter
		{ 'LineNr', { fg = palette.foreground_muted } },
		{ 'CursorLineNr', { fg = palette.rose, bold = true } },
		{ 'SignColumn', { fg = palette.foreground_muted, bg = background } },
		{ 'FoldColumn', { fg = palette.foreground_muted, bg = background } },
		{
			'Folded',
			{ fg = palette.foreground_muted, bg = palette.background_subtle },
		},

		-- Selection and search
		{ 'Visual', { bg = palette.background_selection } },
		{ 'VisualNOS', { link = 'Visual' } },
		{ 'Search', { fg = palette.background, bg = palette.peach } },
		{ 'IncSearch', { fg = palette.background, bg = palette.rose } },
		{ 'CurSearch', { link = 'IncSearch' } },
		{ 'Substitute', { fg = palette.background, bg = palette.blush } },
		{
			'MatchParen',
			{ fg = palette.rose, bg = palette.background_selection, bold = true },
		},

		-- Windows and splits
		{ 'WinSeparator', { fg = palette.border } },
		{ 'VertSplit', { link = 'WinSeparator' } },
		{
			'StatusLine',
			{ fg = palette.foreground, bg = palette.background_panel },
		},
		{
			'StatusLineNC',
			{ fg = palette.foreground_muted, bg = palette.background_panel },
		},
		{ 'WinBar', { fg = palette.foreground, bg = background } },
		{ 'WinBarNC', { fg = palette.foreground_muted, bg = background } },
		{
			'TabLine',
			{ fg = palette.foreground_muted, bg = palette.background_panel },
		},
		{ 'TabLineFill', { bg = palette.background_panel } },
		{ 'TabLineSel', { fg = palette.rose, bg = background, bold = true } },

		-- Completion and wildmenu
		{ 'Pmenu', { fg = palette.foreground, bg = palette.background_popup } },
		{
			'PmenuSel',
			{ fg = palette.foreground, bg = palette.background_selection },
		},
		{ 'PmenuSbar', { bg = palette.background_popup } },
		{ 'PmenuThumb', { bg = palette.border } },
		{ 'WildMenu', { link = 'PmenuSel' } },

		-- Invisible characters
		{ 'NonText', { fg = palette.border } },
		{ 'Whitespace', { fg = palette.border } },
		{ 'SpecialKey', { fg = palette.border } },
		{ 'Conceal', { fg = palette.foreground_muted } },

		-- Messages
		{ 'Title', { fg = palette.rose, bold = true } },
		{ 'Directory', { fg = palette.aqua } },
		{ 'ErrorMsg', { fg = palette.rose } },
		{ 'WarningMsg', { fg = palette.peach } },
		{ 'MoreMsg', { fg = palette.jade } },
		{ 'OkMsg', { fg = palette.jade } },
		{ 'ModeMsg', { fg = palette.foreground } },
		{ 'Question', { fg = palette.jade } },
		{ 'QuickFixLine', { bg = palette.background_selection } },

		-- Diagnostics
		{ 'DiagnosticError', { fg = palette.rose } },
		{ 'DiagnosticWarn', { fg = palette.peach } },
		{ 'DiagnosticInfo', { fg = palette.aqua } },
		{ 'DiagnosticHint', { fg = palette.jade } },
		{ 'DiagnosticOk', { fg = palette.sage } },
		{
			'DiagnosticDeprecated',
			{ sp = palette.foreground_muted, strikethrough = true },
		},
		{ 'DiagnosticUnderlineError', { undercurl = true, sp = palette.rose } },
		{ 'DiagnosticUnderlineWarn', { undercurl = true, sp = palette.peach } },
		{ 'DiagnosticUnderlineInfo', { undercurl = true, sp = palette.aqua } },
		{ 'DiagnosticUnderlineHint', { undercurl = true, sp = palette.jade } },
		{ 'DiagnosticUnderlineOk', { undercurl = true, sp = palette.sage } },

		-- LSP text that the editor adds. These default to NonText, which is
		-- too dark to read
		{ 'LspInlayHint', { fg = palette.foreground_soft } },
		{ 'LspCodeLens', { link = 'LspInlayHint' } },
		{ 'LspCodeLensSeparator', { link = 'LspInlayHint' } },
		-- Keep ghost text dim so it does not look like typed code
		{ 'ComplHint', { fg = palette.foreground_muted } },

		-- Spelling
		{ 'SpellBad', { undercurl = true, sp = palette.rose } },
		{ 'SpellCap', { undercurl = true, sp = palette.peach } },
		{ 'SpellLocal', { undercurl = true, sp = palette.aqua } },
		{ 'SpellRare', { undercurl = true, sp = palette.mauve } },

		-- Diff
		{ 'DiffAdd', { fg = palette.jade, bg = palette.background_subtle } },
		{ 'DiffChange', { fg = palette.aqua, bg = palette.background_subtle } },
		{ 'DiffDelete', { fg = palette.rose, bg = palette.background_subtle } },
		{ 'DiffText', { fg = palette.peach, bg = palette.background_selection } },
	}
end

return M
