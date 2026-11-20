# kasumi.nvim colors for zsh-syntax-highlighting and zsh-autosuggestions
# Source this file after the plugins in ~/.zshrc, then run: source ~/.zshrc
# Keep the values in sync with lua/kasumi/palette.lua

# Use exact hex colors, and fall back to the nearest color without truecolor
[[ $COLORTERM == (truecolor|24bit) ]] || zmodload zsh/nearcolor 2>/dev/null

typeset -A _kasumi=(
	foreground '#d3cdca'
	muted      '#818783'
	rose       '#dbaeaf'
	sage       '#babca7'
	blush      '#dcb2ac'
	aqua       '#9cbeba'
	mauve      '#ccb6bf'
	peach      '#dbbfaf'
	lavender   '#cac1c7'
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=${_kasumi[muted]}"

typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES+=(
	default                        "fg=${_kasumi[foreground]}"
	unknown-token                  "fg=${_kasumi[rose]}"
	bracket-error                  "fg=${_kasumi[rose]}"
	comment                        "fg=${_kasumi[muted]}"

	reserved-word                  "fg=${_kasumi[mauve]}"
	command                        "fg=${_kasumi[aqua]}"
	precommand                     "fg=${_kasumi[aqua]}"
	alias                          "fg=${_kasumi[aqua]}"
	suffix-alias                   "fg=${_kasumi[aqua]}"
	global-alias                   "fg=${_kasumi[aqua]}"
	function                       "fg=${_kasumi[aqua]}"
	hashed-command                 "fg=${_kasumi[aqua]}"
	arg0                           "fg=${_kasumi[aqua]}"
	builtin                        "fg=${_kasumi[aqua]},italic"

	commandseparator               "fg=${_kasumi[blush]}"
	redirection                    "fg=${_kasumi[blush]}"
	globbing                       "fg=${_kasumi[blush]}"
	history-expansion              "fg=${_kasumi[blush]}"
	back-quoted-argument           "fg=${_kasumi[blush]}"
	back-quoted-argument-delimiter "fg=${_kasumi[blush]}"
	path_pathseparator             "fg=${_kasumi[blush]}"
	path_prefix_pathseparator      "fg=${_kasumi[blush]}"

	path                           "fg=${_kasumi[lavender]}"
	path_prefix                    "fg=${_kasumi[lavender]}"
	autodirectory                  "fg=${_kasumi[lavender]}"
	single-hyphen-option           "fg=${_kasumi[lavender]}"
	double-hyphen-option           "fg=${_kasumi[lavender]}"
	assign                         "fg=${_kasumi[lavender]}"
	named-fd                       "fg=${_kasumi[lavender]}"
	rc-quote                       "fg=${_kasumi[lavender]}"
	dollar-double-quoted-argument  "fg=${_kasumi[lavender]}"
	back-double-quoted-argument    "fg=${_kasumi[lavender]}"
	back-dollar-quoted-argument    "fg=${_kasumi[lavender]}"

	single-quoted-argument         "fg=${_kasumi[sage]}"
	double-quoted-argument         "fg=${_kasumi[sage]}"
	dollar-quoted-argument         "fg=${_kasumi[sage]}"

	numeric-fd                     "fg=${_kasumi[peach]}"
)

unset _kasumi
