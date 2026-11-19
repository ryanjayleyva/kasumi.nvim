-- Collect plugin groups from lua/kasumi/plugins/.
local M = {}

local plugin_modules = { 'gitsigns' }

function M.get(palette, options)
	local groups = {}
	for _, module_name in ipairs(plugin_modules) do
		local module = require('kasumi.plugins.' .. module_name)
		vim.list_extend(groups, module.get(palette, options))
	end
	return groups
end

return M
