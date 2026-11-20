-- kulala.nvim highlight groups
local M = {}

function M.get(palette)
	-- HTTP method colors in the OpenAPI panel, replacing the fixed Swagger colors
	return {
		{ 'KulalaOpenAPIMethodGet', { fg = palette.aqua, bold = true } },
		{ 'KulalaOpenAPIMethodPost', { fg = palette.jade, bold = true } },
		{ 'KulalaOpenAPIMethodPut', { fg = palette.peach, bold = true } },
		{ 'KulalaOpenAPIMethodDelete', { fg = palette.rose, bold = true } },
		{ 'KulalaOpenAPIMethodPatch', { fg = palette.sage, bold = true } },
		{ 'KulalaOpenAPIMethodHead', { fg = palette.mauve, bold = true } },
		{ 'KulalaOpenAPIMethodOptions', { fg = palette.lavender, bold = true } },
	}
end

return M
