

alias build='python3 setup.py install'
alias build2='python2 setup.py install'
alias projects='cd /home/ec2-user/projects'
alias gitlwa='git clone https://github.com/ImperialAlphaLab/licapy-web-api'
alias ram='rm -rf *'

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
alias yumupdate='yum update'
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



#show aliases
alias a='echo "------------Your aliases------------";alias'
#Apply changes to aliases
alias sa='source ~/.bash_aliases;echo "Bash aliases sourced."'
#Edit Aliases
alias via='gksudo gedit ~/.bash_aliases &'
