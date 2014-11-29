declare -x MODE=''
declare -rx DMGR_VERSION="0.10.0"
declare -rx DMGR_DIST=$(uname -r)
declare -rx DMGR_CONFDIR=$HOME/.dmgr/conf
declare -rx DMGR_PLUGINDIR=$HOME/.dmgr/plugins
declare -rx DMGR_HOOKDIR=$HOME/.dmgr/hooks
declare -rx DMGR_PATHDIR=$HOME/.dmgr/paths
declare -rx DMGR_SRCDIR=$HOME/.dmgr/src
declare -rx DMGR_REPODIR=$(cat $DMGR_PATHDIR/_repo)
declare -r DMGR_INUSE=$DMGR_CONFDIR/inuse.list
declare -r DMGR_SUPPORT=$DMGR_CONFDIR/support.list
declare -r DMGR_PLUGIN=$DMGR_CONFDIR/plugin.list
declare -r DMGR_OFFICIAL=$DMGR_CONFDIR/official.list
declare -A DMGR_TMP_SCRIPT
DMGR_TMP_SCRIPT=(1 /tmp/dmgr-tmp-script 2 /tmp/dmgr-tmp-script-nested)
readonly DMGR_TMP_SCRIPT
export PATH=$PATH:$DMGR_SRCDIR/traps
