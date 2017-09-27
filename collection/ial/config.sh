#!/bin/bash
# Central First configuration

preconfigure () {
  #
  echo '----- Preconfigure'
  sudo apt update
  sudo apt-get update
  sudo apt install gcc
  sudo apt install python-pip
  sudo apt install python3-pip
  sudo apt-get install git
}

base_struct () {
  echo '----- Base_struct'
  mkdir /home/ubuntu/ial
  # Ial group stay empty for no reason
  mkdir /home/ubuntu/backups
  mkdir /home/ubuntu/data
  # squeduled jobs
}

gitdv () {
    echo "cloning project $1 into /home/ubuntu/ial/$1"
    # $2 and $3 username and password
    if [ -z $2 && -z $3 ]; then
        git clone $(http://$2:$3@github.com/ImperialAlphaLab/$1)
    else
        git clone #######
        #################
        #################
    fi
}

gitdvfile () {
    while read p; do
      gitdv projects $p
    done <$1
}



installall_ () {
    while read p; do
      cd $HOME/ialc/$p
      /.config && /.setup
    done <$1
}

askforname () {
    #
}

makeconfig () {
    preconfigure
    base_struct
    gitdvfile ial_git.txt
    instal_all ial_git.txt
}

config () {
    cp /home/ubuntu/ialc/mysql_utils/lib/instances.json /home/ubuntu/data
    cp /home/ubuntu/ialc/mysql_utils/lib/hierarchy.json /home/ubuntu/data
}

###########

THISINSTANCE=askforname()
makeconfigure
exit 0
