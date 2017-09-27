#!/bin/bash

source github.sh

GARBAGE_PATH="$HOME/garbage"
export GARBAGE_PATH

if [ ! -d "$GARBAGE_PATH" ]; then
    mkdir $GARBAGE_PATH
    echo "Creating garbage ... [ OK ]"
elif
    echo "Garbage dir ... [ OK ]"
fi

function

function to_garbage () {
    fidr="$1"
    echo "Garbage ... processing"
    cp -rf $fidr $GARBAGE_PATH
    if [ -e "$GARBAGE_PATH/$fidr" ]; then
        echo "[ OK ]"
    else
        echo "Error : 1"
        exit 1
    fi
}

function copy_in_git_pkg () {

}

function git_push () {

}

function update_github_pkg () {

}

function clear_garbage () {
    rm -rf "$GARBAGE_PATH/*"
}

function make_command_line () {

}
