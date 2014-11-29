#
# Parse feature list to array format of shellscript.
# @param $1 The list file path.
#
function _parse() {
  echo $(cat $1) | tr -s ',' ' '
}

#
# Parse array to feature list and save it.
# @param $1 The list file path.
# @param $2... An array containing feature names.
#
function _save() {
  echo ${@:2} | tr -s ' ' ',' > $1
}

#
# Get file paths with specific pattern.
# @param $1 Directory.
# @param $2 Pattern.
#
function _get() {
  find $1 | grep -E $2 2>/dev/null
}


#
# Link symlinks.
#
function _link() {
  local src= dst=
  
  if [ $# -le 2 ]; then
    src=$(eval "echo $1" | sed "s,@,${DMGR_REPODIR}/common/,")
    if [ $# -eq 2 ]; then
      dst=$(eval "echo ${2}")
    else
      dst=$HOME/.$(echo $1 | sed "s/@//")
    fi
    [ $DMGR_DEBUGMODE ] &&
      ln -sv $src $dst || ln -s $src $dst
  else
    echo "Too many arguments."
    return 1
  fi

  return 0
}

#
# Unlink symlinks.
# @param $1 Original file path.
#
function _unlink() {
  declare -a lns
  local e=

  if [ $# -ge 2 ]; then
    echo "Too many arguments."
    return 1
  fi

  [ "${LISTS}" = "" ] && LISTS=$(find $HOME -ls)

  lns=($(echo $LISTS |
  grep -oE "/.*\s\->.*$" |
  tr -s " \-> " "," |
  grep -E $(echo $(eval "echo $1" | sed "s,@,${DMGR_REPODIR}/common/,") | sed "s,\.,\\\.,g")"$" |
  sed "s,\,.*,,g"))

  for e in $lns; do
    [ $DMGR_DEBUGMODE ] &&
      rm -v $e || rm $e
  done

  return 0
}

#
# Make symlinks for scripts in ./bin
# @param $1... The script name.
#
function _use() {
  local e=

  for e in $(echo $@ | tr -s ',' ' '); do
    if [ ! -e $DMGR_REPODIR/bin/$e ]; then
      echo "${e} is not found."
      continue
    else
      ln -s $DMGR_REPODIR/bin/$e $HOME/bin/$e
    fi
  done
}

# Remove symlinks from ~/bin
# @param $1... The script name.
#
function _unuse() {
  local e=

  for e in $(echo $@ | tr -s ',' ' '); do
    if [ ! -e $HOME/bin/$e ]; then
      echo "${e} is not found."
      continue
    else
      rm -f $HOME/bin/$e
    fi
  done
}

#
# Report an error and exit with error status.
# @param $1 An error message.
#
function _reperr() {
  echo $1 && exit 1
}

#
# Bold message font.
# @param $1 Message.
#
function _fbold() {
  echo -e "\033[0;1m${1}\033[0;0m"
}

#
# Add debug prefix to message top.
# #param $1 Message.
#
function _d() {
  local e= c=true

  if [ $DMGR_DEBUGMODE ]; then
    for e in ${@}; do
      if [ $c = true ]; then
        echo -e "\x1B[35mDEBUG\x1B[0m ${e}"
        c=false
      else
        echo -e "\x1B[35m >>> \x1B[0m ${e}"
      fi
    done
  fi
}

#
# Check if a list has specific value.
# @param $1 The file name including a list.
# @param $2 The value.
#
function _exist() {
  [[ ${$(_parse $1)[(r)$2]} == ${2} ]] && return 0
  return 1
}

#
# Enforce argument checking.
# @param $1 Argument length.
# @param $2 The condition.
# @param $3 Specified length.
#
function _enforce_arg_chk() {
  if ! eval "[ $(($1 - 1)) $(echo $2 | sed 's/>=/-ge/' | sed 's/=/-eq/') ${3} ]"; then
    echo "Missing arguments."
    return 1
  fi
  return 0
}
