<a name="top"></a>Radic Bash Lib
======================


[![GitHub Version](https://img.shields.io/github/tag/robinradic/radic-bash-lib.svg?style=flat-square&label=version)](http://badge.fury.io/gh/robinradic%2Fradic-bash-lib)
[![License](http://img.shields.io/badge/license-MIT-ff69b4.svg?style=flat-square)](http://radic.mit-license.org)
  
-----------
  
### Overview

- [Example](#example)
- [Exclude default opts](#exclude-default-opts)
- [Copyright/License](#copyright-license)
  
-----------
  
<a name="example"></a>
### Example [^](#top)
Checkout the [example](example.sh) bash script for a full example.
  
```sh
MYDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${MYDIR}/PATH-TO-LIB/_main.sh"

if [ "$is_help" == "true" ]; then
    cat << EOF

$(f bold)$(fc green)help$(f off)
$(f dim)Always execute scripts from the working directory$(f off)

$(f bold)Arguments:     $(f off)
    -h                     $(fc orange)(optional)$(f off) Show this help overview
    -v                     $(fc orange)(optional)$(f off) Enable verbose output
    -d                     $(fc orange)(optional)$(f off) Enable debug output
    -p <path>              $(fc orange)(optional)$(f off) only update specified submodule <path>
fi

Echo "Doing submodule update in ${PWD}"
Echo verbose "debug: ${is_debug}. verbose: ${is_verbose}"
Echo verbose "Only show me on verbose"

Exec 'git submodule update --init --recursive --remote --force'
Exec `git submodule foreach -q --recursive 'branch="$(git config -f $toplevel/.gitmodules submodule.$name.branch)" && git fetch --all > /dev/null 2>&1  && git checkout $branch  > /dev/null 2>&1 && git pull  > /dev/null 2>&1'`

if [ "$pflag" != "" ]; then
    Echo info "Got a mflag: ${pflag}"
fi
```

<a name="exclude-default-opts"></a>
### Exclude default opts [^](#top)
Exclude default opts and define your own
  
```bash
NO_OPTS=1
MYDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${MYDIR}/PATH-TO-LIB/_main.sh"

# Define your own options
is_verbose="false"
is_debug="false"
is_help="false"
pflag=""
tflag=""

while getopts "tp:hvd" flag; do
  case "${flag}" in
    p) pflag="${OPTARG}" ;;
    t) tflag="${OPTARG}" ;;
    h) is_help="true" ;;
    d) is_debug="true" ;;
    v) is_verbose="true" ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done

```
  
<a name="copyright-license"></a>
### Copyright/License [^](#top)
Copyright 2015 [Robin Radic Radic](https://github.com/robinradic) - [MIT Licensed](http://radic.mit-license.org)
