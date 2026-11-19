-- Define syntax and Treesitter groups
-- Return a list of { group_name, definition } pairs, like the other modules
local M = {}

function M.get(palette, _options)
	return {
		-- Classic Vim syntax groups. Treesitter captures link to these by
		-- default, so most code gets its color from this section
		{ 'Comment', { fg = palette.foreground_muted, italic = true } },
		{ 'SpecialComment', { fg = palette.lavender, italic = true } },
		{ 'Todo', { fg = palette.background, bg = palette.peach, bold = true } },

		{ 'Constant', { fg = palette.peach } },
		{ 'String', { fg = palette.sage } },
		{ 'Character', { fg = palette.sage } },
		{ 'Number', { fg = palette.peach } },
		{ 'Boolean', { fg = palette.peach } },
		{ 'Float', { fg = palette.peach } },

		{ 'Identifier', { fg = palette.foreground } },
		{ 'Function', { fg = palette.aqua } },

		{ 'Statement', { fg = palette.mauve } },
		{ 'Conditional', { fg = palette.mauve } },
		{ 'Repeat', { fg = palette.mauve } },
		{ 'Label', { fg = palette.mauve } },
		{ 'Keyword', { fg = palette.mauve } },
		{ 'Exception', { fg = palette.mauve } },
		{ 'Operator', { fg = palette.blush } },

		{ 'PreProc', { fg = palette.jade } },
		{ 'Include', { fg = palette.jade } },
		{ 'Define', { fg = palette.jade } },
		{ 'Macro', { fg = palette.jade } },
		{ 'PreCondit', { fg = palette.jade } },

		{ 'Type', { fg = palette.mist } },
		{ 'StorageClass', { fg = palette.mist } },
		{ 'Structure', { fg = palette.mist } },
		{ 'Typedef', { fg = palette.mist } },

		{ 'Special', { fg = palette.lavender } },
		{ 'SpecialChar', { fg = palette.lavender } },
		{ 'Tag', { fg = palette.rose } },
		{ 'Delimiter', { fg = palette.foreground_muted } },
		{ 'Debug', { fg = palette.rose } },

		{ 'Underlined', { fg = palette.aqua, underline = true } },
		{ 'Error', { fg = palette.rose } },
		{ 'Ignore', { fg = palette.foreground_muted } },

		{ 'Added', { fg = palette.jade } },
		{ 'Changed', { fg = palette.aqua } },
		{ 'Removed', { fg = palette.rose } },

		-- Treesitter captures that need a different color than their default
		-- Vim group
		{ '@variable', { fg = palette.foreground } },
		{ '@variable.parameter', { fg = palette.lavender } },
		{ '@variable.builtin', { fg = palette.rose } },
		{ '@property', { fg = palette.cream } },
		{ '@module', { fg = palette.cream } },
		{ '@constructor', { fg = palette.mist } },
		{ '@attribute', { fg = palette.jade } },

		{ '@function.builtin', { fg = palette.aqua, italic = true } },
		{ '@constant.builtin', { fg = palette.peach, italic = true } },
		{ '@type.builtin', { fg = palette.mist, italic = true } },
		{ '@string.escape', { fg = palette.lavender } },
		{ '@string.regexp', { fg = palette.blush } },
		{ '@string.special.url', { fg = palette.aqua, underline = true } },

		{ '@tag', { fg = palette.rose } },
		{ '@tag.attribute', { fg = palette.cream } },
		{ '@tag.delimiter', { fg = palette.foreground_muted } },
		{ '@punctuation.delimiter', { fg = palette.foreground_muted } },
		{ '@punctuation.bracket', { fg = palette.foreground_muted } },
		{ '@punctuation.special', { fg = palette.blush } },

		{
			'@comment.error',
			{ fg = palette.background, bg = palette.rose, bold = true },
		},
		{
			'@comment.warning',
			{ fg = palette.background, bg = palette.peach, bold = true },
		},
		{ '@comment.todo', { link = 'Todo' } },
		{
			'@comment.note',
			{ fg = palette.background, bg = palette.aqua, bold = true },
		},

		-- Markup (Markdown, help files, ...)
		{ '@markup.heading', { fg = palette.rose, bold = true } },
		{ '@markup.strong', { bold = true } },
		{ '@markup.italic', { italic = true } },
		{ '@markup.strikethrough', { strikethrough = true } },
		{ '@markup.underline', { underline = true } },
		{ '@markup.link', { fg = palette.aqua } },
		{ '@markup.link.url', { fg = palette.aqua, underline = true } },
		{ '@markup.raw', { fg = palette.sage } },
		{ '@markup.list', { fg = palette.blush } },

		-- Diff
		{ '@diff.plus', { link = 'Added' } },
		{ '@diff.minus', { link = 'Removed' } },
		{ '@diff.delta', { link = 'Changed' } },
	}
end

return M
