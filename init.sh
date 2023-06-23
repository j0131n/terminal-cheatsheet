# colorized terminal
force_color_prompt=yes
color_prompt=yes

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
 PS1='[\D{%H:%M:%S}] ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \[\033[01;33m\]=> $(parse_git_branch) \[\033[0;37m\]\n$ '
else
 PS1='[\D{%H:%M:%S}] ${debian_chroot:+($debian_chroot)}\u@\h => \w$(parse_git_branch)\n$ '
fi

unset color_prompt force_color_prompt

# 
if [ -f ${HOME}/.bash_aliases ]; then
    . ${HOME}/.bash_aliases
    source ${HOME}/.bash_aliases
fi
