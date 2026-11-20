# eza colors for kasumi.nvim
# Source this file from ~/.zshrc, then run: source ~/.zshrc
# Keep the values in sync with lua/kasumi/palette.lua

# Convert a hex color to the truecolor escape that eza reads
_kasumi_sgr() {
	local hex=${1#\#}
	print -n "38;2;$((16#${hex[1,2]}));$((16#${hex[3,4]}));$((16#${hex[5,6]}))"
}

# Colors not listed here keep eza's defaults, which follow the terminal palette
export EZA_COLORS="\
uu=$(_kasumi_sgr '#dbaeaf'):\
un=$(_kasumi_sgr '#dbaeaf'):\
gu=$(_kasumi_sgr '#ccb6bf'):\
gn=$(_kasumi_sgr '#ccb6bf'):\
da=$(_kasumi_sgr '#b3c2c9'):\
di=$(_kasumi_sgr '#d3cdca'):\
fi=$(_kasumi_sgr '#cac1c7')"

unset -f _kasumi_sgr
