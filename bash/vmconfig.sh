#virtualmachineconfig

# yum&phphttp
sudo yum -y update
sudo yum install -y httpd24 php56 php56-mysqlnd

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >>~/.bash_profile

# python
brew install python
brew install python3
brew install django
brew install sympy
