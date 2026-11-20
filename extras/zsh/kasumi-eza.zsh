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
ur=$(_kasumi_sgr '#dbbfaf'):\
uw=$(_kasumi_sgr '#d7bebd'):\
ux=$(_kasumi_sgr '#dbd4c9'):\
ue=$(_kasumi_sgr '#dbd4c9'):\
gr=$(_kasumi_sgr '#dcb2ac'):\
gw=$(_kasumi_sgr '#dbaeaf'):\
gx=$(_kasumi_sgr '#babca7'):\
tr=$(_kasumi_sgr '#dcb2ac'):\
tw=$(_kasumi_sgr '#dbaeaf'):\
tx=$(_kasumi_sgr '#babca7'):\
uu=$(_kasumi_sgr '#b3c2c9'):\
un=$(_kasumi_sgr '#b3c2c9'):\
gu=$(_kasumi_sgr '#cac1c7'):\
gn=$(_kasumi_sgr '#cac1c7'):\
da=$(_kasumi_sgr '#d3cdca'):\
di=$(_kasumi_sgr '#d7bebd'):\
fi=$(_kasumi_sgr '#d3cdca'):\
bu=$(_kasumi_sgr '#d3cdca')"

unset -f _kasumi_sgr
