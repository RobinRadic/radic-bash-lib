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




_git_curl(){
    local to=$1
    local method=$2
    local url=$3
    shift
    shift
    shift
    local data=$*

    local cmd="curl"

    cmd="${cmd} --progress-bar"

    cmd="${cmd} --header \"Content-Type: application/json\""

    if [[ "$to" == "radic" ]]; then
        cmd="${cmd} --user \"${GIT_RADIC_USERNAME}:${GIT_RADIC_PASSWORD}\""
    elif [[ "$to" == "github" ]]; then
        cmd="${cmd} --user \"${GITHUB_USERNAME}:${GITHUB_TOKEN}\""
    elif [[ "$to" == "bitbucket" ]]; then
        cmd="${cmd} --user \"${BITBUCKET_USERNAME}:${BITBUCKET_PASSWORD}\""
    else
        echo "Error: wrong to: ${to}"
        exit 1
    fi

    cmd="${cmd} --request ${method} ${url}"

    if [[ ! -z "$data" ]]; then
        cmd="${cmd} --data '${data}'"
    fi

    response=$(eval $cmd)

    echo -e "\n--------: CURL REQUEST INFO :--------\nto: $to \nmethod: $method \nurl: $url \ndata: $data \ncommand: $cmd \nresponse: $response \n--------:--------------:--------"

}
