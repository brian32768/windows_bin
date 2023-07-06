# At work they put home on J: which is a network drive, a fine idea, 
# but most Windows programs expect it to be on C:
# I have finally beaten this into submission by setting
# an environment variable explicitly HOME=C:/Users/bwilson
# Now it loads everything NORMALLY. FINALLY

REPOS=$HOME/Documents/source

alias ls="ls -FC"

# apps
alias agp="pushd ${HOME}/ArcGISPro_Projects"
alias d="pushd ${HOME}/Downloads"
alias e='emacs'
alias g='grep'

alias db='docker buildx build'
alias dc='docker compose'
alias de='docker exec -it'
alias dl='docker compose logs --follow'
alias down='docker compose down --remove-orphans'
alias up='docker compose up -d'

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

export APPS="//cc-gis/C\$/inetpub/wwwroot/Apps"
alias apps='pushd ${APPS}'

export ITEMS="//cc-gis/C\$/arcgis/arcgisportal/content/items"
alias items='pushd ${ITEMS}'

export SERVER="//cc-gisserver/C\$/arcgisserver"
alias server='pushd ${SERVER}'

# machines
alias cc="ssh cc-testmaps"
alias gis="ssh cc-gis"
alias flex="ssh cc-gislicense"
alias cache="ssh cc-giscache"

export npm_config_access=public
export npm_config_init_author="Brian H Wilson"
export npm_config_init_author_email="brian@wildsong.biz"
export npm_config_license="MIT"
export npm_config_scope="@map46"

# Emacs from Chocolatey
LOCALEMACS="/c/tools/emacs/bin/"
test -e $LOCALEMACS && PATH=$PATH:$LOCALEMACS

# This Esri thing fails, it will insist on modifying your .bash_profile
# and once it does, it will try to run a script called
# conda.sh from a non-existent path somewhere in TMP.
#CONDA_PATH="/c/ArcGISPro/bin/Python"
#
# My workaround: use chocolatey to install the Miniconda version
# in parallel on Windows; it needs the CONDA_PATH set somewhere,
# so I do that in the Windows environment
#...
# unless you can't today 2022-12-06
if [ -d "$CONDA_PATH" ]; then
  echo "CONDA_PATH=$CONDA_PATH"
else
  CONDA_PATH="/c/Users/bwilson/Miniconda3"
fi
export CONDA_PATH

if [ -d "${CONDA_PATH}" ]; then
# NOTE Set CONDARC in your environment so that everyone sees it not just bash
  CONDASH="${CONDA_PATH}/etc/profile.d/conda.sh"
  if [ -f "$CONDASH" ]; then
    # This works if Miniconda is installed
    . $CONDASH
    PATH="$CONDA_PATH:$PATH:$CONDA_PATH/Scripts"
  fi
else
  echo No CONDA_PATH set.
fi

alias webgisdr="/c/Program Files/ArcGIS/Portal/tools/webgisdr/webgisdr.bat"

if [ -d 'C:/Program Files/ArcGIS/Server/framework/runtime/ArcGIS/Resources/ArcPy/' ]; then
  echo SERVER
  # This fixes a problem in the Server tools/admin scripts.
  ARCPY="C:/Program Files/ArcGIS/Server/framework/runtime/ArcGIS/Resources/ArcPy/"
  export PYTHONPATH=$ARCPY

  alias content="cd C:/arcgis/arcgisportal/content/items"
fi

# Our local Docker registry
export REGISTRY="foxtrot.clatsopcounty.gov
