#!/usr/bin/env bash

# This extracts the colors from the theme file,
# and exports the colors and environment variables.

getColor(){
    echo "#"$(grep color$1 ~/.terminalcolors | cut -d# -f2)
}

export      BLACK=$(getColor  0)
export   LT_BLACK=$(getColor  8)
export        RED=$(getColor  1)
export     LT_RED=$(getColor  9)
export      GREEN=$(getColor  2)
export   LT_GREEN=$(getColor 10)
export     YELLOW=$(getColor  3)
export  LT_YELLOW=$(getColor 11)
export       BLUE=$(getColor  4)
export    LT_BLUE=$(getColor 12)
export    MAGENTA=$(getColor  5)
export LT_MAGENTA=$(getColor 13)
export       CYAN=$(getColor  6)
export    LT_CYAN=$(getColor 14)
export      WHITE=$(getColor  7)
export   LT_WHITE=$(getColor 15)
