#! /usr/bin/env bash
# GitHub Readme CLI (`grcli`).
#
# Version: 1.0.0
# Author: Ahmad Awais
# Author URL: https://AhmadAwais.com/
#
#️ Usage: grcli

VERSION="1.0.0"

# Defaults.
####.#### ———————————————————————————————————————————— COLORS ———————————————————————————————————————————— ####.####
# colors from tput
# http://stackoverflow.com/a/20983251/950111
# Num  Colour    #define         R G B
# 0    black     COLOR_BLACK     0,0,0
# 1    red       COLOR_RED       1,0,0
# 2    green     COLOR_GREEN     0,1,0
# 3    yellow    COLOR_YELLOW    1,1,0
# 4    blue      COLOR_BLUE      0,0,1
# 5    magenta   COLOR_MAGENTA   1,0,1
# 6    cyan      COLOR_CYAN      0,1,1
# 7    white     COLOR_WHITE     1,1,1
#
# tput setab [1-7] # Set the background colour using ANSI escape
# tput setaf [1-7] # Set the foreground colour using ANSI escape
# tput sgr0    # Reset text format to the terminal's default
# tput bel     # Play a bell
#
# Usage:
# red=`tput setaf 1`
# green=`tput setaf 2`
# r=`tput sgr0`
# echo "${rb}red text ${green}green text${r}"

bb=`tput setab 0` #set background black
bf=`tput setaf 0` #set foreground black

gb=`tput setab 2` # set background green
gf=`tput setab 2` # set background green

blb=`tput setab 4` # set background blue
blf=`tput setaf 4` # set foreground blue

rb=`tput setab 1` # set background red
rf=`tput setaf 1` # set foreground red

wb=`tput setab 7` # set background white
wf=`tput setaf 7` # set foreground white

r=`tput sgr0`     # r to defaults

# CLI Start!
clear

echo "——————————————————————————————————"
echo "${gb}${bf}
⚡️ GitHub Readme CLI (grcli)
— Version: $VERSION
${r}"

echo "-"
echo "——————————————————————————————————"
echo "${wb}${bf}➤  Sandbox: y/n: (n)${r}"
echo "——————————————————————————————————"
echo "⚡️  y = YES: Clone to sandbox"
echo "⚡️  n = NO: Find README.md in the pwd"
echo "——————————————————————————————————"
read -r IS_SANDBOX

echo "-"
echo "——————————————————————————————————"
echo "${wb}${bf}➤  Name:${r}"
echo "——————————————————————————————————"
read -r THE_NAME

echo "-"
echo "——————————————————————————————————"
echo "${wb}${bf}➤  Description:${r}"
echo "——————————————————————————————————"
read -r THE_DSC



# If Sandbox!
if [[ 'y' == $IS_SANDBOX ]]; then
	echo "-"
	echo "——————————————————————————————————"
	echo "${wb}${bf}➤  REPO URL:${r}"
	echo "——————————————————————————————————"
	read -r THE_REPO_URL

	# Move to Sandbox.
	cd /Users/"$USER"/web/sandbox

	# Clone the repo.
	rm -rf 'GRLCI_TMP'
	mkdir 'GRLCI_TMP'
	cd GRLCI_TMP
	git clone $THE_REPO_URL .
fi

#
# Readme Edits.
#

# Add HTML Table description at the top of readme file.
echo "
<table width='100%'>
    <tr>
        <td align='left' width='100%' colspan='2'>
            <strong>$THE_NAME</strong><br />
            $THE_DSC
        </td>
    </tr>
    <tr>
        <td>
            A FOSS (Free & Open Source Software) project. Maintained by <a href='https://github.com/ahmadawais'>@AhmadAwais</a>.
        </td>
        <td align='center'>
            <a href='https://AhmadAwais.com/'>
                <img src='https://i.imgur.com/Asg4d3k.png' width='100' />
            </a>
        </td>
    </tr>
</table>
" | cat - readme.md >> tmp && mv tmp README.md

echo "-"
echo "——————————————————————————————————"
echo "${wb}${bf}➤  PUSH (y/n): (n)${r}"
echo "——————————————————————————————————"
read -r THE_PUSH

if [[ 'y' === $THE_PUSH ]]; then
	git add README.md
	git commit -m 'ADD: ReadMe FOSS info.'
	git push
fi

echo "——————————————————————————————————"
echo "✅✅✅✅ DONE! 🎉 ✅✅✅✅"
echo "——————————————————————————————————"
