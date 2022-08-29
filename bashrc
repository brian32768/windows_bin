# At work they put home on J: which is a network drive, a fine idea, 
# but most Windows programs expect it to be on C:
# I have finally beaten this into submission by setting
# an environment variable explicitly HOME=C:/Users/bwilson
# Now it loads everything NORMALLY. FINALLY

# windows
REPOS=$HOME/Documents/source/repos
if [ ! -d "$REPOS" ]; then
  # linux
  REPOS=$HOME/source/repos
fi

# apps
alias agp="pushd ${HOME}/ArcGISPro_Projects"
alias d="pushd ${HOME}/Downloads"
alias E='emacs'
alias G='grep'
alias dc='docker-compose'
alias down='docker-compose down --remove-orphans'
alias up='docker-compose up -d'
alias gs='git status'
alias gc='git commit'
alias gp='git pull'
alias acrobat="C:/Program\ Files\ (x86)/Adobe/Acrobat\ Reader\ DC/Reader/AcroRd32.exe"

# places
export FAVORITES="C:/Users/bwilson/AppData/Roaming/Esri/ArcGISPro/Favorites"
alias favorites='pushd $FAVORITES'
alias ormap="pushd ${HOME}/Documents/source/ORMAP"
alias repos="pushd ${REPOS}"
alias pictures="pushd ${HOME}/Pictures"
alias docs="pushd ${HOME}/Documents"
alias books="pushd /j/Books/"
alias apps="cd //cc-gis/C$/inetpub/wwwroot/Apps"
alias items="cd //cc-gis/C$/arcgis/arcgisportal/content/items"

# machines
alias cc="ssh cc-testmaps"
alias gis="ssh cc-gis"
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
LOCALEMACS="/c/Users/bwilson/Documents/emacs/bin/"
test -e $LOCALEMACS && PATH=$PATH:$LOCALEMACS

# This Esri thing fails, it will insist on modifying your .bash_profile
# and once it does, it will try to run a script called
# conda.sh from a non-existent path somewhere in TMP.
#CONDA_PATH="/c/ArcGISPro/bin/Python"
#
# My workaround: use chocolatey to install the Miniconda version
# in parallel on Windows; it needs the CONDA_PATH set somewhere,
# so I do that in the Windows environment

if [ -d "${CONDA_PATH}" ]; then
# NOTE Set CONDARC in your environment so that everyone sees it not just bash
  CONDASH="${CONDA_PATH}/etc/profile.d/conda.sh"
  if [ -f "$CONDASH" ]; then
    # This works if Miniconda is installed
    . $CONDASH
    PATH="$PATH:/c/tools/miniconda3/Scripts"
  fi
else
  echo No CONDA_PATH set.
fi

alias webgisdr="/c/Program Files/ArcGIS/Portal/tools/webgisdr/webgisdr.bat"

PATH_7Z="/c/Program Files/7-Zip"
export PATH=$PATH:${PATH_7Z}


if [ -d 'C:/Program Files/ArcGIS/Server/framework/runtime/ArcGIS/Resources/ArcPy/' ]; then
  echo SERVER
  # This fixes a problem in the Server tools/admin scripts.
  ARCPY="C:/Program Files/ArcGIS/Server/framework/runtime/ArcGIS/Resources/ArcPy/"
  export PYTHONPATH=$ARCPY

  alias content="cd C:/arcgis/arcgisportal/content/items"
fi
