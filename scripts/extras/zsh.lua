-- zsh: eza colors and zsh-syntax-highlighting colors
local shared = require('extras.shared')
local palette = shared.palette

-- Every eza field this theme sets, in the order they are written.
-- Fields left out keep eza's defaults, which follow the terminal palette.
local eza_fields = {
	{ 'ur', 'User-readable file', palette.peach },
	{ 'uw', 'User-writable file', palette.rose_light },
	{ 'ux', 'User-executable file', palette.cream },
	{ 'ue', 'User-executable file (other executable type)', palette.cream },
	{ 'gr', 'Group-readable file', palette.blush },
	{ 'gw', 'Group-writable file', palette.rose },
	{ 'gx', 'Group-executable file', palette.sage },
	{ 'tr', 'Other-readable file', palette.blush },
	{ 'tw', 'Other-writable file', palette.rose },
	{ 'tx', 'Other-executable file', palette.sage },
	{ 'uu', 'Setuid file', palette.rose_light },
	{ 'un', 'Setuid file (no permission)', palette.rose_light },
	{ 'gu', 'Setgid file', palette.rose_light },
	{ 'gn', 'Setgid file (no permission)', palette.rose_light },
	{ 'da', 'File with extended attributes', palette.lavender },
	{ 'di', 'Directory', palette.lavender },
	{ 'fi', 'Regular file', palette.cream },
	{ 'bu', 'Block device', palette.cream },
}

-- '#dbbfaf' to the truecolor escape eza reads: 38;2;219;191;175
local function truecolor_escape(hex)
	local red = tonumber(hex:sub(2, 3), 16)
	local green = tonumber(hex:sub(4, 5), 16)
	local blue = tonumber(hex:sub(6, 7), 16)
	return ('38;2;%d;%d;%d'):format(red, green, blue)
end

local function build_eza_colors()
	local lines = {
		'# eza colors for kasumi.nvim',
		'# Source this file from ~/.zshrc, then run: source ~/.zshrc',
		'# ' .. shared.generated_note,
		'',
		"# Colors not listed here keep eza's defaults, which follow the terminal palette",
		'',
	}

	for _, field in ipairs(eza_fields) do
		local key, description = field[1], field[2]
		table.insert(lines, ('# %s = %s'):format(key, description))
	end

	vim.list_extend(lines, { '', 'export EZA_COLORS="\\' })
	for index, field in ipairs(eza_fields) do
		local key, hex = field[1], field[3]
		local is_last = index == #eza_fields
		-- Every entry but the last continues the line with a ':' and a '\'
		local ending = is_last and '"' or ':\\'
		table.insert(lines, key .. '=' .. truecolor_escape(hex) .. ending)
	end

	return shared.join_lines(lines)
end

-- Short names the highlight styles use below
local syntax_colors = {
	{ 'foreground', palette.cream },
	{ 'muted', palette.foreground_muted },
	{ 'rose', palette.rose },
	{ 'sage', palette.sage },
	{ 'blush', palette.blush },
	{ 'aqua', palette.aqua },
	{ 'mauve', palette.mauve },
	{ 'peach', palette.peach },
	{ 'lavender', palette.lavender },
}

-- Highlight styles, grouped as they are written. A blank line separates each
-- section, and each entry is a color followed by the styles that use it.
local syntax_sections = {
	{
		{ 'foreground', 'default' },
		{ 'rose', 'unknown-token', 'bracket-error' },
		{ 'muted', 'comment' },
	},
	{
		{ 'mauve', 'reserved-word' },
		{
			'aqua',
			'command',
			'precommand',
			'alias',
			'suffix-alias',
			'global-alias',
			'function',
			'hashed-command',
			'arg0',
		},
		{ 'aqua', 'builtin', italic = true },
	},
	{
		{
			'blush',
			'commandseparator',
			'redirection',
			'globbing',
			'history-expansion',
			'back-quoted-argument',
			'back-quoted-argument-delimiter',
			'path_pathseparator',
			'path_prefix_pathseparator',
		},
	},
	{
		{
			'lavender',
			'path',
			'path_prefix',
			'autodirectory',
			'single-hyphen-option',
			'double-hyphen-option',
			'assign',
			'named-fd',
			'rc-quote',
			'dollar-double-quoted-argument',
			'back-double-quoted-argument',
			'back-dollar-quoted-argument',
		},
	},
	{
		{
			'sage',
			'single-quoted-argument',
			'double-quoted-argument',
			'dollar-quoted-argument',
		},
	},
	{
		{ 'peach', 'numeric-fd' },
	},
}

local function build_syntax_highlighting()
	local lines = {
		'# kasumi.nvim colors for zsh-syntax-highlighting and zsh-autosuggestions',
		'# Source this file after the plugins in ~/.zshrc, then run: source ~/.zshrc',
		'# ' .. shared.generated_note,
		'',
		'# Exact hex colors, with the nearest color as a fallback without truecolor',
		'[[ $COLORTERM == (truecolor|24bit) ]] || zmodload zsh/nearcolor 2>/dev/null',
		'',
		'typeset -A _kasumi=(',
	}

	for _, color in ipairs(syntax_colors) do
		table.insert(lines, ("\t%-10s '%s'"):format(color[1], color[2]))
	end

	vim.list_extend(lines, {
		')',
		'',
		'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=${_kasumi[muted]}"',
		'',
		'typeset -gA ZSH_HIGHLIGHT_STYLES',
		'ZSH_HIGHLIGHT_STYLES+=(',
	})

	for section_index, section in ipairs(syntax_sections) do
		if section_index > 1 then
			table.insert(lines, '')
		end
		for _, entry in ipairs(section) do
			local color = entry[1]
			local modifier = entry.italic and ',italic' or ''
			for style_index = 2, #entry do
				table.insert(
					lines,
					('\t%-30s "fg=${_kasumi[%s]}%s"'):format(
						entry[style_index],
						color,
						modifier
					)
				)
			end
		end
	end

	vim.list_extend(lines, { ')', '', 'unset _kasumi' })
	return shared.join_lines(lines)
end

return {
	['extras/zsh/kasumi-eza.zsh'] = build_eza_colors(),
	['extras/zsh/kasumi-syntax.zsh'] = build_syntax_highlighting(),
}
