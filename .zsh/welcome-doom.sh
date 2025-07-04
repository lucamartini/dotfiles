#!/bin/bash
# shellcheck disable=SC2059

# Define Doom-inspired colors using ANSI 256-color codes
RED="\033[38;5;196m"
DARK_RED="\033[38;5;124m"
ORANGE="\033[38;5;208m"
BROWN="\033[38;5;130m"
YELLOW="\033[38;5;220m"
RESET="\033[0m"

# Print ASCII art with Doom colors
printf "${DARK_RED}=================     ===============     ===============   ========  ========${RESET}\n"
printf "${RED}\\\\\\ . . . . . . .\\\\\\   //. . . . . . .\\\\\\   //. . . . . . .\\\\\\  \\\\\\. . .\\\\\\// . . //${RESET}\n"
printf "${BROWN}||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||${RESET}\n"
printf "${BROWN}|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||${RESET}\n"
printf "${ORANGE}||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||${RESET}\n"
printf "${ORANGE}|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||${RESET}\n"
printf "${YELLOW}||. . ||   ||-'  || ||  \`-||   || . .|| ||. . ||   ||-'  || ||  \`|\\_ . .|. .||${RESET}\n"
printf "${YELLOW}|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ \`-_/| . ||${RESET}\n"
printf "${BROWN}||_-' ||  .|/    || ||    \\|.  || \`-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||${RESET}\n"
printf "${BROWN}||    ||_-'      || ||      \`-_||    || ||    ||_-'      || ||   | \\  / |  \`||${RESET}\n"
printf "${RED}||    \`'         || ||         \`'    || ||    \`'         || ||   | \\  / |   ||${RESET}\n"
printf "${DARK_RED}||            .===' \`===.         .==='.\`===.         .===' /==. |  \\/  |   ||${RESET}\n"
printf "${RED}||         .=='   \\_|-_ \`===. .==='   _|_   \`===. .===' _-|/   \`==  \\/  |   ||${RESET}\n"
printf "${ORANGE}||      .=='    _-'    \`-_  \`='    _-'   \`-_    \`='  _-'   \`-_  /|  \\/  |   ||${RESET}\n"
printf "${YELLOW}||   .=='    _-'          '-__\\._-'         '-_./__-'         \`' |. /|  |   ||${RESET}\n"
printf "${BROWN}||.=='    _-'                                                     \`' |  /==.||${RESET}\n"
printf "${BROWN}=='    _-'                                                            \\/   \`==${RESET}\n"
printf "${DARK_RED}\\   _-'                                                                \`-_   /${RESET}\n"
printf "${DARK_RED} \`\`'                                                                      \`\`'${RESET}\n"
