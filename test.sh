#!/usr/bin/env bash

MYDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${MYDIR}/_lib.sh"

cat << EOF
--------------------------------------------------------------------
| $(f bold)Verbose:          $(f off)$(fc cyan)${is_verbose} $(f off)
| $(f bold)Debug:            $(f off)$(fc cyan)${is_debug} $(f off)
--------------------------------------------------------------------
EOF

Exec ls -al
