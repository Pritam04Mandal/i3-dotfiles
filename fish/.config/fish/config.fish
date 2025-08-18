if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x ANDROID_HOME /home/pritam/Android/Sdk
    set -x PATH $ANDROID_HOME/platform-tools $PATH
    set -x PATH $ANDROID_HOME/emulator $PATH
    set -x PATH $ANDROID_HOME/tools/bin $PATH
    set -x PATH $ANDROID_HOME/cmdline-tools/latest/bin $PATH
    set -x UID (id -u)
    set -x GID (id -g)
    set -x TERM xterm-256color
    set -x EDITOR vim
    set -x FLUTTER_HOME /home/pritam/flutter/bin
    set -x PATH $FLUTTER_HOME/cache/dart-sdk/ $PATH
    set -x PATH $FLUTTER_HOME/ $PATH 
    set -x XDG_CONFIG_HOME /home/pritam/.config
end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
oh-my-posh init fish --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/illusi0n.omp.json | source
starship init fish | source
