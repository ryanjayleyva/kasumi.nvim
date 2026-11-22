-- tmux: one config file, written from a template
local shared = require('extras.shared')
local palette = shared.palette

-- The palette color behind each {{name}} in the template below
local colors = {
	text = palette.foreground,
	selection = palette.background_selection,
	accent = palette.rose,
	popup = palette.background_popup,
	border = palette.border,
	panel = palette.background_panel,
	editor = palette.background,
	muted = palette.foreground_muted,
	subtle = palette.background_subtle,
	date = palette.mist,
	highlight = palette.peach,
}

-- tmux uses #{...}, %Y and @ itself, so colors are marked with {{name}}
local template = [[
# tmux colors for kasumi.nvim
# Copy this file to ~/.config/tmux/kasumi.tmux, then add to your tmux.conf:
#   source-file ~/.config/tmux/kasumi.tmux
# {{generated_note}}

set -g mode-style "fg={{text}},bg={{selection}}"

set -g message-style "fg={{accent}},bg={{popup}}"
set -g message-command-style "fg={{accent}},bg={{popup}}"

set -g pane-border-style "fg={{border}}"
set -g pane-active-border-style "fg={{accent}}"

set -g status "on"
set -g status-justify "left"
set -g status-style "fg={{text}},bg={{panel}}"

set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE

# A rose block with dark text marks the session, as in the Neovim statusline
set -g status-left "#[fg={{editor}},bg={{accent}},bold] #S #[default] "
set -g status-right "#{prefix_highlight} #[fg={{date}},bg={{subtle}}] %Y-%m-%d  %I:%M %p #[fg={{editor}},bg={{accent}},bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" = "24" ]' {
  set -g status-right "#{prefix_highlight} #[fg={{date}},bg={{subtle}}] %Y-%m-%d  %H:%M #[fg={{editor}},bg={{accent}},bold] #h "
}

setw -g window-status-separator ""
setw -g window-status-style "NONE,fg={{muted}},bg={{panel}}"
setw -g window-status-activity-style "underscore,fg={{highlight}},bg={{panel}}"
setw -g window-status-format " #I  #W #F "
setw -g window-status-current-format "#[fg={{accent}},bg={{subtle}},bold] #I  #W #F "

# tmux-plugins/tmux-prefix-highlight support
set -g @prefix_highlight_fg "{{editor}}"
set -g @prefix_highlight_bg "{{highlight}}"
]]

local function build_tmux_config()
	local values =
		vim.tbl_extend('error', { generated_note = shared.generated_note }, colors)
	return (
		template:gsub('{{([%w_]+)}}', function(name)
			return assert(values[name], 'tmux template has no color named ' .. name)
		end)
	)
end

return {
	['extras/tmux/kasumi.tmux'] = build_tmux_config(),
}
