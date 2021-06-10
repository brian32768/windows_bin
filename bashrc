# At work they put home on J: which is a network drive, a fine idea, 
# but most Windows programs expect it to be on C:
if [ -d /c/Users/bwilson.CLATSOP ]; then
    WINHOME="/c/Users/bwilson.CLATSOP"

    # Additional tools installed with MinGW setup program live here...
    PATH=${WINHOME}/Portable/msys/1.0/bin:$PATH
else
    WINHOME="/c/Users/${USERNAME}"

    # I think the ming64 is already installed here at home
    #PATH=/ming64/bin:$PATH
fi
export WINHOME

# I cannot override HOME here, I'd have to do that in Windows
# and I am pretty sure I don't want to do that.
#export HOME....

PATH=$PATH:"/c/Program Files (x86)/Adobe/Acrobat Reader DC/Reader"
alias acrobat=AcroRD32.exe

alias home="pushd ${HOME}"
alias winhome="pushd ${WINHOME}"
alias agp="pushd ${HOME}/ArcGISPro_Projects"
alias d="pushd ${WINHOME}/Downloads"
alias repos="pushd ${WINHOME}/source/repos"

alias apps="cd /c/inetpub/wwwroot/Apps"

alias books="pushd /j/Books/"
alias cc="ssh cc-testmaps"
alias gis="ssh bwilson@cc-gis"
alias cache="ssh cc-giscache"
alias cachegis="ssh gis@cc-giscache"

alias bellman="ssh bwilson@bellman.wildsong.biz"
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

CONDA_PATH=$HOME/Miniconda3
export CONDARC=$HOME/bin/condarc
source ${CONDA_PATH}/etc/profile.d/conda.sh

export PATH
export WINHOME
