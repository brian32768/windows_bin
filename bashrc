# At work they put home on J: which is a network drive, a fine idea, 
# but most Windows programs expect it to be on C:
# I have finally beaten this into submission by setting
# an environment variable explicitly HOME=C:/Users/bwilson
# Now it loads everything NORMALLY. FINALLY

alias agp="pushd ${HOME}/ArcGISPro_Projects"
alias d="pushd ${HOME}/Downloads"
alias E='emacs'
alias G='grep'
alias dc='docker-compose'
alias gs='git status'
alias gc='git commit'
alias gp='git pull'

alias ormap="pushd ${HOME}/source/ORMAP"
alias repos="pushd ${HOME}/source/repos"
alias pictures="pushd ${HOME}/Pictures"
alias docs="pushd ${HOME}/Documents"

alias acrobat="C:/Program Files (x86)/Adobe/Acrobat Reader DC/Reader/AcroRd32.exe"
alias apps="cd /c/inetpub/wwwroot/Apps"

alias books="pushd /j/Books/"
alias cc="ssh cc-testmaps"
alias gis="ssh cc-gis"
alias servers="ssh cc-gisserver"
alias datastore="ssh cc-gisdatastore"
alias flex="ssh cc-gislicense"
alias cache="ssh cc-giscache"

alias bellman="ssh bellman"
alias bluehost="ssh bluehost"
alias map46="ssh cc-testmaps"
alias wenda="ssh wenda"
alias w6gkd='ssh w6gkd'
alias tarra='ssh tarra'

export npm_config_access=public
export npm_config_init_author="Brian H Wilson"
export npm_config_init_author_email="brian@wildsong.biz"
export npm_config_license="MIT"
export npm_config_scope="@map46"

# Emacs
#LOCALEMACS="/c/Program Files/Emacs/X86_64/bin/"
LOCALEMACS="/c/Users/bwilson/Portable/emacs/bin/"
test -e $LOCALEMACS && PATH=$PATH:$LOCALEMACS

# This Esri thing fails, it will insist on modifying your .bash_profile
# and once it does, it will try to run a script called
# conda.sh from a non-existent path somewhere in TMP.
#CONDA_PATH="/c/ArcGISPro/bin/Python"
#
# My workaround was to use chocolatey to install the Miniconda version in parallel on Windows

if [ -d "${CONDA_PATH}" ]; then
# NOTE Set CONDARC in your environment so that everyone sees it not just bash
  CONDASH="${CONDA_PATH}/etc/profile.d/conda.sh"
  if [ -f "$CONDASH" ]; then
    # This works if Miniconda is installed
    . $CONDASH
  fi
fi

alias webgisdr="/c/Program Files/ArcGIS/Portal/tools/webgisdr/webgisdr.bat"

PATH_7Z="/c/Program Files/7-Zip"
export PATH=$PATH:${PATH_7Z}

# This makes the Server scripts in tools/admin function
ARCPY="C:/Program Files/ArcGIS/Server/framework/runtime/Resources/ArcPy/"
if [ -d "$ARCPY" ]; then
  export PYTHONPATH=$ARCPY
fi

