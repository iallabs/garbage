# .bash_profile


# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# setups

alias yumupdate='sudo yum -y update'

getbrew () {
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
    echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >>~/.bash_profile
}

getpython2 () {
    brew install python2
}

getpython3 () {
    brew install python3
}

pip3classic () {
    # pip3 install pymysql
    brew install sympy
    brew install numpy
    # pip3 install bs4
    # pip3 install scipy
    brew install django
}

setupvm () {
    cd /home
    cd /ec2-*
    yumupdate
    getbrew
    getpython2
    getpython3
    pip3classic
    codir projects
    copro licapy && p3test && p3setup
    copro imptools && p3test && p3setup
    copro lwa && p3test && p3setup
    copro shell-tools && p3test && p3setup
}

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# explorer & tools
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias ll='ls -l -sort'
alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
alias mvf='mv -t'

# dir
alias ldir='ls -l | grep ^d'
alias mdir="mkdir -pv"
alias cdhome="cd /home/ec2-user/projects"


cd2 () {
  if [ -z $1 ] ; then
      # NAME=${1%.*}
      # mkdir $NAME && cd $NAME
      case $1 in
        lwa          cd /home/ec2-user/projects/lwa           ;;
        licapy       cd /home/ec2-user/projects/licapy        ;;
        shell-tools  cd /home/ec2-user/projects/shell-tools   ;;
        *)           cd $1 ;;
      esac
  else
      echo "$1 - file does not exist"
  fi
}

group () {
    mkdir -p $1
    mv $2 $1
}

mvdi () {
    mv -t $1 ls|grep $2
}

codir () {
    mkdir -p $1
    cd $1
}

copro () {
    codir $1
    gitpro $1
}

cobpro () {
    copro $1

}

gitpro () {
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


buildpro () {
    cd $1
    python3 setup.py install
    if [ -f $2 ]; then
        python3
    fi
}

testpro () {
    cd $1
    python3 setup.py test
    if [ -f $2 ]; then
        python3
    fi
}


# mysql
alias sqladmin='mysql -uroot -p'

# tools

alias d='date +%F'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%m-%d-%Y"'

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ]; then
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

# python

alias p3setup="python3 setup.py install"
alias p2setup="python2 setup.py install"
alias p3test="python3 setup.py test"
alias p2test="python2 setup.py test"

# licapy

# licapy Api

licapyapi () {
    python3 /home/ec2-user/projects/licapy-web-api/lwa/databases/api.py $1
}
