#!/usr/bin/env bash

git_current_branch(){
    branch_name=$(git symbolic-ref -q HEAD)
    branch_name=${branch_name##refs/heads/}
    branch_name=${branch_name:-HEAD}
    echo "${branch_name}"
}

git_tag_last(){
    echo "$(git describe --abbrev=0 --tags)"
}

git_tag_last_patch(){
    echo "$(git describe --abbrev=0 --tags | cut -f 3 -d .)"
}

git_tag_last_minor(){
    echo "$(git describe --abbrev=0 --tags | cut -f 2 -d .)"
}

git_tag_last_major(){
    echo "$(git describe --abbrev=0 --tags | cut -f 1 -d . | sed -e 's/v//g')"
}
