-- Define kulala.nvim groups
local M = {}

function M.get(palette, _options)
	-- Replace the fixed Swagger colors on HTTP methods in the OpenAPI panel
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
