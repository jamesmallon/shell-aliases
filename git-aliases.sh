#!/bin/bash

# Author: James Mallon <jamesmallondev@gmail.com
# Created: 2013-04-28

# ---------------- GIT -------------------

# alias to show git status
alias gista='git status'

# alias to git add .
alias gita='git add'

# alias to make git fetch
alias gife='git fetch'

# alias to make git fetch
alias gibra='git branch -va'

# alias to get the difference
alias giff="git diff"

# alias to git merge
alias gime="git merge"

# alias to checkout on a branch
giche() {
	if [ $# -eq 0 ]
		then
		echo "We're expecting the branch name to check it out"
	else
		git checkout "$1"
	fi
}

# alias to create and checkout on a branch
alias gicheb="git checkout -b"

# function to add, commit and push in one command
gipu() {
	#if [ $# -eq 0 ]
	#	then
	#	echo "We're expecting the commiting message"
	#else
	#	git commit -m "$1"
		local currBranch=`git branch | grep \* | cut -d ' ' -f2`
		git push -u origin $currBranch
	#fi
}

gipul() {
	local currBranch=`git branch | grep \* | cut -d ' ' -f2`
	git pull origin $currBranch
}

# function to init, add origin and fetch in one command
gitin() {
	if [ $# -eq 0 ]
		then
		echo "We're expecting the remote url"
	else
		git init
		git remote add origin "$1"
		git fetch
	fi
}

# Function used to reset local repository to the last commited remote branch
alias gire="git reset --hard HEAD"

# Function used to clean local reposiory from untracked files
alias gicle="git clean -f"

# function to init, add origin and fetch in one command
 gitin() {
	if [ $# -eq 0 ]
		then
		echo "We're expecting the remote url"
	else
		git init
		git remote add origin "$1"
		git fetch
	fi
}

# function to init, add origin and fetch in one command
gitg() {
	if [ $# -eq 0 ]
		then
		echo "We're expecting the tag name and annotation"
	else
		git tag -a $1 -m $2
	fi
}

# function to add all files, commit, push in a "dev" branch, then merge in the 
# master, push and get back to dev
gitedm() {
	if [ $# -eq 0 ]
		then
		echo "We're expecting the commit message"
	else
        git checkout dev;
		git add .;
        git commit -S -m "$1";
        git push origin dev;
        git checkout master;
        git merge dev;
        git push origin master;
        git checkout dev;
	fi
}

# function to add all files, commit, push in a "dev" branch, then merge in the 
# master, push and get back to dev
gitredm() {
	if [ $# -lt 2 ]
		then
		echo "We're expecting the file and the commit message"
	else
        git checkout dev;
		git add $1;
        git commit -S -m "$2";
        git push origin dev;
        git checkout master;
        git merge dev;
        git push origin master;
        git checkout dev;
	fi
}

# COMMIT
alias gico='git commit -S -m'

# TAGS

# fetching remote tags
alias gitgfr='git fetch --all --tags --prune'

# checking out on a local tag
alias gitgc='git checkout tags/'

# pushing a tag to remote repo
alias gitgp="git push origin"

# removing a tag from remote
alias gitrr="git push origin :"

# listing remote tags
alias gitrl="git ls-remote --tags origin"

# deleting a remote tag
alias gibradr="git push origin :"


# OVERWRITING LOCAL WITH REMOTE

# applies a fetch --all
alias gifea="git fetch --all"

# reset branch files to match the remote (git reset --hard origin/branch_name)
alias gireh="git reset --hard origin/"

# get new on a conflict 
alias gitnw="git checkout --theirs"

# add a push remote origin
alias gitarempush="git remote set-url --add --push origin"

# add only the deleted
alias gitad="git ls-files --deleted | xargs git add"

# ----------------- SHORTENING COMMANDS ------------------

# to be used when commiting the superfulous first upload 
gifu(){
    git add .
    git commit -m ":rocket: First upload"
}

# to be used when updating the .gitignore
giupig() {
    git add .gitignore
	if [ $# -eq 0 ]
        then
        git commit -m ":ghost: Updating .gitignore"
    else
        git commit -m ":ghost: Updating .gitignore - $1"
    fi
}

# to be used when updating the README file
giuprd() {
    git add README.md
	if [ $# -eq 0 ]
        then
        git commit -m ":clipboard: Updating README.md"
    else
        git commit -m ":clipboard: Updating README.md - $1"
    fi
}

# rollback to specific commit
giroll() {
    if [ $# -ne 2 ]
    then
        echo "Expecting [commit-id] [branch]"
    git reset --hard $1
    git push -f origin $2
}
