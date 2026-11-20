-- Plugin highlight groups, one module per plugin in lua/kasumi/plugins/
-- Each module receives (palette, options) and may declare only what it uses
local M = {}

local plugin_modules = {
	'gitsigns',
	'cmp',
	'telescope',
	'treesitter-context',
	'dap',
	'neotest',
	'mason',
	'kulala',
	'dadbod',
}

function M.get(palette, options)
	local groups = {}
	for _, module_name in ipairs(plugin_modules) do
		local module = require('kasumi.plugins.' .. module_name)
		vim.list_extend(groups, module.get(palette, options))
	end
	return groups
end

return M
