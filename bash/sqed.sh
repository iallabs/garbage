#!/bin/bash
# add scheduled tasks with get_squedualed

alias crontab='sudo contab'

get_squedualed () {
    cd $HOME
    while read p; for
      echo $p
    done < $1
}

squedule_job () {
    cd $HOME
    $1 >> squed_
    crontab squed_
}

clear_jobs () {
    crontab -r
    rm -rf squed_ && touch squed_
}

remove_job () {
    clear_jobs
}
