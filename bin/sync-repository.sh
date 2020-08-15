#!/usr/bin/env bash

source $(dirname $0)/config.sh

set -e
set -x

function split()
{
    SHA1=`./bin/splitsh-lite --prefix=$1`
    git push $2 "$SHA1:refs/heads/$CURRENT_BRANCH" -f
}

function remote()
{
    git remote add $1 $2 || true
}

function subtree()
{
    SUBTREE_PREFIX="roles/${1}"

    git subtree add --prefix=$SUBTREE_PREFIX $1 $CURRENT_BRANCH || true
}

for REMOTE in $REMOTES
do
    REMOTE_URL="git@github.com:kilip/ansible-role-${REMOTE}.git"
    remote $REMOTE $REMOTE_URL
    subtree $REMOTE
    #split "roles/$REMOTE" $REMOTE
done