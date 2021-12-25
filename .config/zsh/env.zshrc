export PATH="/home/samy/Scripts:/home/samy/.cargo/bin${PATH:+:${PATH}}"
export PATH="${PATH}:/home/samy/.config/composer/vendor/bin"
export PATH="${PATH}:/home/samy/.local/bin"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export ANDROID_HOME=$HOME/Android/SDK
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH="${PATH}:${ANDROID_HOME}tools/:${ANDROID_HOME}platform-tools/"

export REACT_EDITOR=codium
