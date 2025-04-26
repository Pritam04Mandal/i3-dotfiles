if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x ANDROID_HOME /home/pritam/Android/Sdk
    set -x PATH $ANDROID_HOME/platform-tools $PATH
    set -x PATH $ANDROID_HOME/emulator $PATH
    set -x PATH $ANDROID_HOME/tools/bin $PATH
    set -x PATH $ANDROID_HOME/cmdline-tools/latest/bin $PATH
end
