

alias build='python3 setup.py install'
alias build2='python2 setup.py install'
alias projects='cd /home/ec2-user/projects'

buildproject () {
    cd $1
    build
}

buildproject2() {
    cd $1
    build2
}

licapydb () {
    python3 /home/ec2-user/projects/licapy-web-api/lwa/databases/cmdline.py $1
}

buildir () {
    cd $1
    python setup.py install
}

getproject () {
  if [ -z $1 ] ; then
      # NAME=${1%.*}
      # mkdir $NAME && cd $NAME
      case $1 in
        lwa          git clone https://github.com/ImperialAlphaLab/licapy-web-api    ;;
        licapy       git clone https://github.com/ImperialAlphaLab/licapy            ;;
        shell-tools  git clone https://github.com/ImperialAlphaLab/shell-tools       ;;
        *)           echo "unknoown" ;;
      esac
  else
      echo "$1 - file does not exist"
  fi
}

alias d='date +%F'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%m-%d-%Y"'
# mysql as root
alias mysqlr='sudo mysql -u root -p'
#

group () {
    mkdir -p $1
    mv $2 $1
}

alias mvf='mv -t'
mvdi () {
    mv -t $1 ls|grep $2
}

#
alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
#
alias update='yum update'
alias updatey='yum -y update'
#
#lists contents of current directory with file permisions
alias ll='ls -l -sort'

#list all directories in current directories
alias ldir='ls -l | grep ^d'
#
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias mkdir="mkdir -pv"

mcd () {
    mkdir -p $1
    cd $1
}


function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

#show aliases
alias a='echo "------------Your aliases------------";alias'
#Apply changes to aliases
alias sa='source ~/.bash_aliases;echo "Bash aliases sourced."'
#Edit Aliases
alias via='gksudo gedit ~/.bash_aliases &'
