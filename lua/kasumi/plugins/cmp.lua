-- Define nvim-cmp groups
local M = {}

-- Reuse the syntax colors so a kind looks the same in the menu and in code
local function get_kind_colors(palette)
	return {
		{ 'Text', palette.foreground_muted },
		{ 'Method', palette.aqua },
		{ 'Function', palette.aqua },
		{ 'Constructor', palette.mist },
		{ 'Field', palette.cream },
		{ 'Variable', palette.foreground },
		{ 'Class', palette.mist },
		{ 'Interface', palette.mist },
		{ 'Module', palette.cream },
		{ 'Property', palette.cream },
		{ 'Unit', palette.peach },
		{ 'Value', palette.peach },
		{ 'Enum', palette.mist },
		{ 'Keyword', palette.mauve },
		{ 'Snippet', palette.jade },
		{ 'Color', palette.blush },
		{ 'File', palette.sage },
		{ 'Reference', palette.lavender },
		{ 'Folder', palette.sage },
		{ 'EnumMember', palette.peach },
		{ 'Constant', palette.peach },
		{ 'Struct', palette.mist },
		{ 'Event', palette.rose },
		{ 'Operator', palette.blush },
		{ 'TypeParameter', palette.mist },
	}
end

function M.get(palette, _options)
	local groups = {
		-- The defaults inherit Pmenu, which leaves matched characters unmarked
		{ 'CmpItemAbbrMatch', { fg = palette.aqua, bold = true } },
		{ 'CmpItemAbbrMatchFuzzy', { fg = palette.aqua } },
		{
			'CmpItemAbbrDeprecated',
			{ fg = palette.foreground_muted, strikethrough = true },
		},
		{ 'CmpItemMenu', { fg = palette.foreground_muted, italic = true } },
	}

	for _, kind_color in ipairs(get_kind_colors(palette)) do
		local kind, color = kind_color[1], kind_color[2]
		local group_name = 'CmpItemKind' .. kind
		table.insert(groups, { group_name, { fg = color } })
		table.insert(groups, { group_name .. 'Icon', { link = group_name } })
	end

	return groups
end

return M
