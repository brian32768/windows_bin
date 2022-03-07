# At work they put home on J: which is a network drive, a fine idea, 
# but most Windows programs expect it to be on C:
WINHOME="/c/Users/${USERNAME}"

alias home="pushd ${HOME}"
alias winhome="pushd ${WINHOME}"
alias agp="pushd ${HOME}/ArcGISPro_Projects"
alias d="pushd ${WINHOME}/Downloads"
alias ormap="pushd ${WINHOME}/source/ORMAP"
alias repos="pushd ${WINHOME}/source/repos"
alias pictures="pushd ${WINHOME}/Pictures"
alias documents="pushd ${WINHOME}/Documents"
alias acrobat="C:/Program Files (x86)/Adobe/Acrobat Reader DC/Reader/AcroRd32.exe"
alias apps="cd /c/inetpub/wwwroot/Apps"

alias books="pushd /j/Books/"
alias cc="ssh cc-testmaps"
alias gis="ssh bwilson@cc-gis"
alias flex="ssh gis@cc-gislicense"
alias cache="ssh cc-giscache"
alias cachegis="ssh gis@cc-giscache"

alias bellman="ssh bellman"
alias bluehost="ssh -v wildsong@162.241.219.110"
alias map46="ssh cc-testmaps"
alias wenda="ssh -p 2000 bwilson@wenda"
alias w6gkd='ssh -p 2000 w6gkd'
alias tarra='ssh tarra'

export npm_config_access=public
export npm_config_init_author="Brian H Wilson"
export npm_config_init_author_email="brian@wildsong.biz"
export npm_config_license="MIT"
export npm_config_scope="@map46"

# I don't have Node and NPM installed right now, need to fix this.
# Add node and npm; note I forced installation into $WINHOME/Portable
# I tried to move npm and failed (parcel does not like it)
# Remember to do this: npm config set prefix "c:/Users/bwilson/Portable/npm"
#export PATH=$PATH:${WINHOME}/Portable/nodejs:${WINHOME}/AppData/Roaming/npm

# Emacs
#LOCALEMACS="/c/Program Files/Emacs/X86_64/bin/"
LOCALEMACS="/c/Users/bwilson/Portable/emacs/bin/"
test -e $LOCALEMACS && PATH=$PATH:$LOCALEMACS

# This Esri thing fails, it will insist on modifying your .bash_profile
# and once it does, it will try to run a script called
# conda.sh from a non-existent path somewhere in TMP.
#CONDA_PATH="/c/ArcGISPro/bin/Python"
#
# My workaround was to use chocolatey to install the Miniconda version
CONDA_PATH="c:/tools/miniconda3"

if [ -d "${CONDA_PATH}" ]; then
# NOTE Set CONDARC in your environment so that everyone sees it not just bash
  CONDASH="${CONDA_PATH}/etc/profile.d/conda.sh"
  if [ -f "$CONDASH" ]; then
    # This works if Miniconda is installed
    . $CONDASH
  fi
fi

export WINHOME
alias webgisdr="/c/Program Files/ArcGIS/Portal/tools/webgisdr/webgisdr.bat"

PATH_7Z="/c/Program Files/7-Zip"
export PATH=$PATH:${PATH_7Z}
