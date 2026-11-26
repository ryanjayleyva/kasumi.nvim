-- zsh: eza colors and zsh-syntax-highlighting colors
local shared = require('extras.shared')
local palette = shared.palette

-- Every eza field this theme sets, in the order they are written. Each entry is
-- the key, its description from eza_colors(5), the color, and an optional style.
-- Roles follow the Neovim highlights so the terminal matches the editor:
-- peach numbers and constants, sage strings, aqua functions, mauve keywords,
-- blush operators, mist types, lavender special, rose errors and removed, muted
-- comments and punctuation. Jade is not used here because it is too saturated.
-- Not set, so eza keeps its defaults: ic, bO, ff and the SELinux fields
-- Sn, Su, Sr, St, Sl.
local eza_fields = {
	-- Permission bits: read is peach, write is rose, execute is sage
	{ 'ur', 'User-read permission bit', palette.peach },
	{ 'uw', 'User-write permission bit', palette.rose },
	{ 'ux', 'User-execute permission bit for regular files', palette.sage },
	{ 'ue', 'User-execute permission bit for other file kinds', palette.sage },
	{ 'gr', 'Group-read permission bit', palette.peach },
	{ 'gw', 'Group-write permission bit', palette.rose },
	{ 'gx', 'Group-execute permission bit', palette.sage },
	{ 'tr', 'Others-read permission bit', palette.peach },
	{ 'tw', 'Others-write permission bit', palette.rose },
	{ 'tx', 'Others-execute permission bit', palette.sage },
	{ 'su', 'Setuid, setgid and sticky bits for files', palette.mauve },
	{
		'sf',
		'Setuid, setgid and sticky bits for other file kinds',
		palette.mauve,
	},
	{ 'oc', 'Permissions displayed as octal', palette.foreground_soft },
	{ 'xa', 'Extended attribute indicator', palette.foreground_muted },

	-- File size, the number sets nb, nk, nm, ng and nt, the unit sets ub, uk, um, ug and ut
	{ 'sn', 'Numbers of a file size', palette.peach },
	{ 'sb', 'Units of a file size', palette.foreground_soft },
	{ 'df', "A device's major ID", palette.foreground_soft },
	{ 'ds', "A device's minor ID", palette.foreground_soft },

	-- Owner, group and link count
	{ 'uu', 'A user that is you', palette.mauve },
	{ 'uR', 'A user that is root', palette.rose },
	{ 'un', 'A user that is someone else', palette.foreground_soft },
	{ 'gu', 'A group that you belong to', palette.mauve },
	{ 'gR', 'A group related to root', palette.rose },
	{ 'gn', 'A group you are not a member of', palette.foreground_soft },
	{ 'lc', 'Number of hard links', palette.foreground_soft },
	{
		'lm',
		'Number of hard links for a regular file with at least two',
		palette.peach,
	},

	-- Git: new is lavender, modified is aqua, deleted is rose. Jade is left out because
	-- it is the most saturated color and looks off next to the rest
	{ 'ga', 'New flag in Git', palette.lavender },
	{ 'gm', 'Modified flag in Git', palette.aqua },
	{ 'gd', 'Deleted flag in Git', palette.rose },
	{ 'gv', 'Renamed flag in Git', palette.mauve },
	{ 'gt', 'Modified metadata flag in Git', palette.mist },
	{ 'gi', 'Ignored flag in Git', palette.foreground_muted },
	{ 'gc', 'Conflicted flag in Git', palette.peach },
	{ 'Gm', 'Main branch of repo', palette.aqua },
	{ 'Go', 'Other branch of repo', palette.mauve },
	{ 'Gc', 'Clean branch of repo', palette.lavender },
	{ 'Gd', 'Dirty branch of repo', palette.peach },

	-- Table chrome
	{
		'xx',
		'Punctuation, including many background UI elements',
		palette.foreground_muted,
	},
	{ 'hd', 'Header row of a table', palette.foreground_soft, '4' },
	{ 'da', "A file's date", palette.foreground_soft },
	{ 'in', "A file's inode number", palette.foreground_soft },
	{ 'bl', "A file's number of blocks", palette.foreground_soft },

	-- File kinds
	{ 'di', 'Directories', palette.lavender },
	{ 'ex', 'Executable files', palette.aqua },
	{ 'fi', 'Regular files', palette.foreground },
	{ 'ln', 'Symlinks', palette.mist },
	{ 'lp', 'Path of a symlink', palette.lavender },
	{ 'or', 'Symlinks with no target', palette.rose },
	{ 'cc', 'Escaped character in a filename', palette.lavender },
	{ 'pi', 'Named pipes', palette.lavender },
	{ 'so', 'Sockets', palette.lavender },
	{ 'bd', 'Block devices', palette.lavender },
	{ 'cd', 'Character devices', palette.lavender },
	{ 'sp', 'Special files', palette.lavender },
	{ 'mp', 'Mount point', palette.mist },

	-- Regular files by type
	{ 'sc', 'Source code', palette.foreground },
	{ 'bu', 'Files used to build a project, like a Makefile', palette.rose_light },
	{ 'do', 'Documents, like office suite documents or PDFs', palette.cream },
	{ 'im', 'Images', palette.mauve },
	{ 'vi', 'Videos', palette.mauve },
	{ 'mu', 'Lossy music', palette.mauve },
	{ 'lo', 'Lossless music', palette.mauve },
	{ 'cr', 'Cryptography files, like a key or certificate', palette.rose },
	{ 'co', 'Compressed files', palette.blush },
	{
		'tm',
		"Temporary files, like a text editor's backup",
		palette.foreground_muted,
	},
	{
		'cm',
		'Compilation artifacts, like a Java class file',
		palette.foreground_muted,
	},
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
		"# Fields left out keep eza's defaults, which follow the terminal palette",
		'',
	}

	for _, field in ipairs(eza_fields) do
		local key, description = field[1], field[2]
		table.insert(lines, ('# %s = %s'):format(key, description))
	end

	vim.list_extend(lines, { '', 'export EZA_COLORS="\\' })
	for index, field in ipairs(eza_fields) do
		local key, hex, style = field[1], field[3], field[4]
		local is_last = index == #eza_fields
		-- Every entry but the last continues the line with a ':' and a '\'
		local ending = is_last and '"' or ':\\'
		-- A style like underline (4) goes before the color
		local prefix = style and (style .. ';') or ''
		table.insert(lines, key .. '=' .. prefix .. truecolor_escape(hex) .. ending)
	end

	return shared.join_lines(lines)
end

-- Short names the highlight styles use below
local syntax_colors = {
	{ 'foreground', palette.foreground },
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
		{ 'muted', 'comment', italic = true },
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

-- Short names the powerlevel10k settings use below
local p10k_colors = {
	{ 'foreground', palette.foreground },
	{ 'muted', palette.foreground_muted },
	{ 'rose', palette.rose },
	{ 'sage', palette.sage },
	{ 'aqua', palette.aqua },
	{ 'mauve', palette.mauve },
	{ 'peach', palette.peach },
	{ 'lavender', palette.lavender },
}

-- Each entry is a color followed by the powerlevel10k variables that use it.
-- A blank line separates each section. Braces like {VIINS,VICMD} are expanded
-- by zsh, so one line sets every vi mode.
local p10k_sections = {
	{
		{
			'sage',
			'PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND',
		},
		{
			'rose',
			'PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND',
		},
	},
	{
		{ 'lavender', 'DIR_FOREGROUND', 'DIR_ANCHOR_FOREGROUND' },
		{ 'muted', 'DIR_SHORTENED_FOREGROUND' },
	},
	{
		{ 'sage', 'VCS_CLEAN_FOREGROUND' },
		{ 'lavender', 'VCS_UNTRACKED_FOREGROUND' },
		{ 'aqua', 'VCS_MODIFIED_FOREGROUND' },
		{ 'rose', 'VCS_CONFLICTED_FOREGROUND' },
	},
	{
		{ 'sage', 'STATUS_OK_FOREGROUND', 'STATUS_OK_PIPE_FOREGROUND' },
		{
			'rose',
			'STATUS_ERROR_FOREGROUND',
			'STATUS_ERROR_SIGNAL_FOREGROUND',
			'STATUS_ERROR_PIPE_FOREGROUND',
		},
		{ 'peach', 'COMMAND_EXECUTION_TIME_FOREGROUND' },
		{ 'rose', 'BACKGROUND_JOBS_FOREGROUND' },
		{ 'muted', 'TIME_FOREGROUND' },
	},
	-- The default ~/.p10k.zsh sets a color for every context state, so each
	-- one is listed here, otherwise root and ssh keep the terminal palette
	{
		{ 'foreground', 'CONTEXT_FOREGROUND' },
		{ 'rose', 'CONTEXT_ROOT_FOREGROUND' },
		{ 'mauve', 'CONTEXT_REMOTE_FOREGROUND' },
		{ 'peach', 'CONTEXT_REMOTE_SUDO_FOREGROUND' },
	},
}

local function build_p10k()
	local lines = {
		'# kasumi.nvim colors for powerlevel10k',
		'# Source this file after ~/.p10k.zsh in ~/.zshrc, then run: source ~/.zshrc',
		'# ' .. shared.generated_note,
		'',
		'# p10k.zsh uses ANSI indexes 0-15, which follow the terminal palette, so override with exact hex',
		'',
		'# The git segment is the exception. The default ~/.p10k.zsh draws it with',
		'# my_git_formatter, which hardcodes its own colors, so the VCS lines below do not',
		'# change it. To match, replace the colors in the first block of my_git_formatter',
		'# in ~/.p10k.zsh, the one commented "green foreground", with:',
		'#   ' .. shared.p10k_git_formatter_lines[1],
		'#   ' .. shared.p10k_git_formatter_lines[2],
		'',
		'# Exact hex colors, with the nearest color as a fallback without truecolor',
		'[[ $COLORTERM == (truecolor|24bit) ]] || zmodload zsh/nearcolor 2>/dev/null',
		'',
		'() {',
	}

	-- Anonymous function so these locals do not leak into the shell
	local names = {}
	for _, color in ipairs(p10k_colors) do
		table.insert(names, ("%s='%s'"):format(color[1], color[2]))
	end
	table.insert(lines, '\tlocal ' .. table.concat(names, ' '))

	for _, section in ipairs(p10k_sections) do
		table.insert(lines, '')
		for _, entry in ipairs(section) do
			for variable_index = 2, #entry do
				table.insert(
					lines,
					('\ttypeset -g POWERLEVEL9K_%s=$%s'):format(
						entry[variable_index],
						entry[1]
					)
				)
			end
		end
	end

	table.insert(lines, '}')
	return shared.join_lines(lines)
end

return {
	['extras/zsh/kasumi-eza.zsh'] = build_eza_colors(),
	['extras/zsh/kasumi-p10k.zsh'] = build_p10k(),
	['extras/zsh/kasumi-syntax.zsh'] = build_syntax_highlighting(),
}
