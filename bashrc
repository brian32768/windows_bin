# At work they put home on J: which is a network drive, a fine idea, 
# but most Windows programs expect it to be on C:
WINHOME="/c/Users/${USERNAME}"

# Additional tools installed with MinGW setup program live here...
MSYS="${WINHOME}/Portable/msys/1.0/bin"
test -d $MSYS && PATH=$MSYS:$PATH

PATH=$PATH:"/c/Program Files (x86)/Adobe/Acrobat Reader DC/Reader"
alias acrobat=AcroRD32.exe

alias home="pushd ${HOME}"
alias winhome="pushd ${WINHOME}"
alias agp="pushd ${HOME}/ArcGISPro_Projects"
alias d="pushd ${WINHOME}/Downloads"
alias repos="pushd ${WINHOME}/source/repos"
alias pictures="pushd ${WINHOME}/Pictures"
alias documents="pushd ${WINHOME}/Documents"

alias apps="cd /c/inetpub/wwwroot/Apps"

alias books="pushd /j/Books/"
alias cc="ssh cc-testmaps"
alias gis="ssh bwilson@cc-gis"
alias flex="ssh gis@cc-gislicense"
alias cache="ssh cc-giscache"
alias cachegis="ssh gis@cc-giscache"

#export BELLMAN="47.33.165.207"
export BELLMAN="bellman.wildsong.biz"
alias bellman="ssh bwilson@${BELLMAN}"
alias bluehost="ssh -v wildsong@162.241.219.110"
alias map46="ssh cc-testmaps"

export npm_config_access=public
export npm_config_init_author="Brian H Wilson"
export npm_config_init_author_email="brian@wildsong.biz"
export npm_config_license="MIT"
export npm_config_scope="@map46"

# I don't have Node and NPM installed right now, need to fix this.
# Add node and npm; note I forced installation into $WINHOME/Portable
# I tried to move npm and failed (parcel does not like it)
# Remember to do this: npm config set prefix "c:/Users/bwilson/Portable/npm"
#PATH=$PATH:${WINHOME}/Portable/nodejs:${WINHOME}/AppData/Roaming/npm

# Emacs

# Add emacs either local or J
LOCALEMACS="/c/Program Files/Emacs/X86_64/bin/"
#L=${WINHOME}/Portable/emacs/bin
J=/j/Portable/emacs/bin
test -e $J && PATH=$PATH:$J
#this is already in the environment
#test -e $LOCALEMACS && PATH=$PATH:$LOCALEMACS

# Add yarn
#PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# This Esri thing fails, it will insist on modifying your .bash_profile
# and once it does, it will try to run a script called
# conda.sh from a non-existent path somewhere in TMP.
#CONDA_PATH="/c/ArcGISPro/bin/Python/Scripts"
#
# My workaround was to install the Miniconda version
CONDA_PATH="${WINHOME}/Miniconda3"

if [ -d "${CONDA_PATH}" ]; then
  CONDARC=${HOME}/bin/condarc
  CONDASH="${CONDA_PATH}/etc/profile.d/conda.sh"
  if [ -f "$CONDASH" ]; then
    # This works if Miniconda is installed
    . $CONDASH
  else
    # This might work for ESRI w/o Miniconda
    PATH=${PATH}:${CONDA_PATH}
  fi
fi

export PATH
export WINHOME
