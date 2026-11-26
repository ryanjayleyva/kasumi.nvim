-- README: the palette tables, drawn with one SVG swatch per color
local shared = require('extras.shared')
local palette = shared.palette

local files = {}

local editor_colors = {
	{ role = 'background', hex = palette.background },
	{ role = 'background_panel', hex = palette.background_panel },
	{ role = 'background_popup', hex = palette.background_popup },
	{ role = 'subtle', hex = palette.background_subtle },
	{ role = 'selection', hex = palette.background_selection },
	{ role = 'foreground', hex = palette.foreground },
	{ role = 'foreground_soft', hex = palette.foreground_soft },
	{ role = 'foreground_muted', hex = palette.foreground_muted },
	{ role = 'border', hex = palette.border },
}

-- Every color shown in the README needs a name in palette.lua
local function color_name(hex)
	local name = palette.color_names[hex]
	assert(name, 'palette.lua has no name for ' .. hex)
	return name
end

-- Queues the SVG for this color and returns the markdown image that shows it
local function swatch_image(name, hex)
	local path = 'assets/swatches/' .. hex:sub(2) .. '.svg'
	files[path] = shared.join_lines({
		'<svg xmlns="http://www.w3.org/2000/svg" width="40" height="16" viewBox="0 0 40 16">',
		('\t<rect x="0.5" y="0.5" width="39" height="15" rx="3" fill="%s" stroke="#808080" stroke-opacity="0.5"/>'):format(
			hex
		),
		'</svg>',
	})
	return ('![%s](%s)'):format(name, path)
end

-- A markdown table with every column padded to its widest cell, which is how
-- a markdown formatter lays it out. The first row is the header.
local function markdown_table(rows)
	local widths = {}
	for _, row in ipairs(rows) do
		for column, cell in ipairs(row) do
			widths[column] = math.max(widths[column] or 0, #cell)
		end
	end

	local function format_row(row)
		local cells = {}
		for column, cell in ipairs(row) do
			table.insert(cells, cell .. (' '):rep(widths[column] - #cell))
		end
		return '| ' .. table.concat(cells, ' | ') .. ' |'
	end

	local divider = {}
	for column, width in ipairs(widths) do
		divider[column] = ('-'):rep(width)
	end

	local lines = { format_row(rows[1]), format_row(divider) }
	for row_index = 2, #rows do
		table.insert(lines, format_row(rows[row_index]))
	end
	return table.concat(lines, '\n')
end

local function build_palette_tables()
	local base_rows = { { 'Index', 'Name', 'Color' } }
	for index, hex in ipairs(shared.terminal_colors) do
		local name = color_name(hex)
		table.insert(
			base_rows,
			{ tostring(index - 1), name, swatch_image(name, hex) }
		)
	end

	local editor_rows = { { 'Role', 'Color', 'Variable' } }
	for _, editor_color in ipairs(editor_colors) do
		table.insert(editor_rows, {
			editor_color.role,
			swatch_image(editor_color.role, editor_color.hex),
			color_name(editor_color.hex),
		})
	end

	return table.concat({
		markdown_table(base_rows),
		'',
		'### Editor colors',
		'',
		markdown_table(editor_rows),
	}, '\n')
end

-- Swaps what sits between two marker comments and keeps the markers
local function replace_between_markers(text, start_marker, end_marker, body)
	local _, start_marker_end = text:find(start_marker, 1, true)
	local end_marker_start = text:find(end_marker, 1, true)
	assert(start_marker_end, 'README.md is missing ' .. start_marker)
	assert(end_marker_start, 'README.md is missing ' .. end_marker)

	return text:sub(1, start_marker_end)
		.. '\n\n'
		.. body
		.. '\n\n'
		.. text:sub(end_marker_start)
end

-- Building the tables fills `files` with the swatches, so it runs first
local palette_tables = build_palette_tables()
local readme = replace_between_markers(
	shared.read_file(shared.repo_root .. '/README.md'),
	'<!-- palette:start -->',
	'<!-- palette:end -->',
	palette_tables
)

-- The lines to paste into my_git_formatter for the powerlevel10k git segment
local p10k_git_formatter = table.concat({
	'```zsh',
	shared.p10k_git_formatter_lines[1],
	shared.p10k_git_formatter_lines[2],
	'```',
}, '\n')
files['README.md'] = replace_between_markers(
	readme,
	'<!-- p10k:start -->',
	'<!-- p10k:end -->',
	p10k_git_formatter
)

return files
