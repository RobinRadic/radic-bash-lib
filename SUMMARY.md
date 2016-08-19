
# Summary


## Colors
`$(fc <color>)`
`$(bc <color>)`
`$(f <effect>`
```bash
cat << EOF
    $(f bold)$(fc cyan)${myname}$(f off)
    $(f dim)1. Creates a repository on the Bitbucket Server$(f off)
    $(f bold)Examples:      $(f off)
        $(fc orange)Update all submodules $(f off)
EOF
```
## Functions


##### _make_json
Use PHP array syntax and make it into a JSON string
```bash
json=$(_make_json "[
    'mirrorRepoUrl0' => 'https://github.com/$owner/$repo',
    'password0' => '$GITHUB_PASSWORD',
    'username0' => '$GITHUB_USERNAME',
]")
```
