-- Define vim-dadbod-ui groups
local M = {}

function M.get(palette)
	local status_groups = {
		{ 'dbui_connection_ok', { fg = palette.jade } },
		{ 'dbui_connection_error', { fg = palette.rose } },
	}

	-- The plugin sets these two with fixed colors each time its buffer opens,
	-- after the colorscheme has loaded, so apply them again once it is done
	local group = vim.api.nvim_create_augroup('KasumiDadbod', { clear = true })
	vim.api.nvim_create_autocmd('FileType', {
		group = group,
		pattern = 'dbui',
		callback = function()
			vim.schedule(function()
				for _, status_group in ipairs(status_groups) do
					vim.api.nvim_set_hl(0, status_group[1], status_group[2])
				end
			end)
		end,
	})

	return status_groups
end

return M
