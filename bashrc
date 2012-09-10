# use .localrc for settings specific to one system
. ~/.bash/config
. ~/.bash/aliases

if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git::\1)/'
}
    
export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]: \w \[\033[31m\]\$(parse_git_branch)\[\033[00m\]$\[\033[00m\] "

[[ -s "/home/zcy/.rvm/scripts/rvm" ]] && source "/home/zcy/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
