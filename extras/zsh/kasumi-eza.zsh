# eza colors for kasumi.nvim
# Source this file from ~/.zshrc, then run: source ~/.zshrc
# Values mirror lua/kasumi/palette.lua

# Hex color to the truecolor escape that eza reads
_kasumi_sgr() {
	local hex=${1#\#}
	print -n "38;2;$((16#${hex[1,2]}));$((16#${hex[3,4]}));$((16#${hex[5,6]}))"
}

# Colors not listed here keep eza's defaults, which follow the terminal palette
export EZA_COLORS="\
uu=$(_kasumi_sgr '#9cbeba'):\
un=$(_kasumi_sgr '#9cbeba'):\
gu=$(_kasumi_sgr '#9cbeba'):\
gn=$(_kasumi_sgr '#9cbeba'):\
da=$(_kasumi_sgr '#dcb2ac'):\
di=$(_kasumi_sgr '#dbaeaf'):\
fi=$(_kasumi_sgr '#d3cdca')"

unset -f _kasumi_sgr
