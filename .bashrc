if [ -d /c/Users/bwilson.CLATSOP ]; then
    WINHOME="/c/Users/bwilson.CLATSOP"
else
    WINHOME="/c/Users/bwilson"x
fi
export WINHOME

# Additional tools are installed with the MinGW setup program
# and they live here...
PATH=${WINHOME}/Portable/msys/1.0/bin:$PATH

# I cannot override HOME here, I'd have to do that in Windows
# and I am pretty sure I don't want to do that.
#export HOME....

# No longer available??
#PATH=$PATH:"/c/Program Files (x86)/Adobe/Acrobat 10.0/Acrobat"
#alias acrobat=Acrobat.exe

alias home="pushd ${HOME}"
alias winhome="pushd ${WINHOME}"
alias agp="pushd ${HOME}/ArcGISPro_Projects"
alias d="pushd ${WINHOME}/Downloads"
alias repos="pushd ${WINHOME}/source/repos"

alias apps="cd /c/inetpub/wwwroot/Apps"

alias books="pushd /j/Books/"
alias cc="ssh cc-testmaps"
alias gis="ssh bwilson@cc-gis"
alias delta="ssh delta"
alias cache="ssh gis@cc-giscache"

alias bellman="ssh bellman.wildsong.biz"
alias bluehost="ssh -v wildsong@162.241.219.110"
alias map46="ssh cc-testmaps"

export npm_config_access=public
export npm_config_init_author="Brian H Wilson"
export npm_config_init_author_email="brian@wildsong.biz"
export npm_config_license="MIT"
export npm_config_scope="@map46"

export PATH
export WINHOME

# Add node and npm; note I forced installation into $WINHOME/Portable

# I tried to move npm and failed (parcel does not like it)
# Remember to do this: npm config set prefix "c:/Users/bwilson/Portable/npm"
PATH=$PATH:${WINHOME}/Portable/nodejs:${WINHOME}/AppData/Roaming/npm

# Add emacs either local or J
L=${WINHOME}/Portable/emacs/bin
J=/j/Portable/emacs/bin
if [ -e $L ]; then 
    PATH=$PATH:$L
elif [ -e $J ]; then
    PATH=$PATH:$J
fi

# Add yarn
#PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

