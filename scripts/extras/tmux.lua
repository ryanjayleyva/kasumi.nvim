-- tmux: one config file, written from a template
local shared = require('extras.shared')
local palette = shared.palette

-- tmux uses #{...}, %Y and @ itself, so palette colors are marked with {{name}}
local template = [[
# tmux colors for kasumi.nvim
# Copy this file to ~/.config/tmux/kasumi.tmux, then add to your tmux.conf:
#   source-file ~/.config/tmux/kasumi.tmux
# {{generated_note}}

set -g mode-style "fg={{foreground}},bg={{background_selection}}"

set -g message-style "fg={{rose}},bg={{background_popup}}"
set -g message-command-style "fg={{rose}},bg={{background_popup}}"

set -g pane-border-style "fg={{border}}"
set -g pane-active-border-style "fg={{rose}}"

set -g status "on"
set -g status-justify "left"
set -g status-style "fg={{foreground}},bg={{background_panel}}"

set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE

# A rose block with dark text marks the session, as in the Neovim statusline
set -g status-left "#[fg={{background}},bg={{rose}},bold] #S #[default] "
set -g status-right "#{prefix_highlight} #[fg={{mist}},bg={{background_subtle}}] %Y-%m-%d  %I:%M %p #[fg={{background}},bg={{rose}},bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" = "24" ]' {
  set -g status-right "#{prefix_highlight} #[fg={{mist}},bg={{background_subtle}}] %Y-%m-%d  %H:%M #[fg={{background}},bg={{rose}},bold] #h "
}

setw -g window-status-separator ""
setw -g window-status-style "NONE,fg={{foreground_muted}},bg={{background_panel}}"
setw -g window-status-activity-style "underscore,fg={{peach}},bg={{background_panel}}"
setw -g window-status-format " #I  #W #F "
setw -g window-status-current-format "#[fg={{rose}},bg={{background_subtle}},bold] #I  #W #F "

# tmux-plugins/tmux-prefix-highlight support
set -g @prefix_highlight_fg "{{background}}"
set -g @prefix_highlight_bg "{{peach}}"
]]

local function build_tmux_config()
	return (
		template:gsub('{{([%w_]+)}}', function(name)
			if name == 'generated_note' then
				return shared.generated_note
			end
			return assert(palette[name], 'palette.lua has no color named ' .. name)
		end)
	)
end

return {
	['extras/tmux/kasumi.tmux'] = build_tmux_config(),
}
