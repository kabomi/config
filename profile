defaults write com.apple.finder AppleShowAllFiles YES

#Default editor for BASH
EDITOR="vim"

#ALIAS
#alias ll='ls -l'
#alias java_list='ls /Library/Java/JavaVirtualMachines |ag jdk.*'
#alias java_use='/usr/libexec/java_home -v '
alias kill_grep='killGrep'
alias agh='agInHistoryBash'
alias list_open_ports='sudo lsof -i -P | grep -i "listen"'
alias check_port='sudo lsof -i -P | grep -i $1'

#FUNCTIONS
function agInHistoryBash(){
  ag $1 ~/.bash_history
}
function killGrep() {
  ps xa | grep $1 | `awk '{ print $1 }' | xargs kill`
}
function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $1`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
  echo JAVA_HOME set to $JAVA_HOME
  java -version
 }
function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

export JAVA_HOME=/opt/jdk1.6.0_45/bin/java
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
#export PATH="$PATH":/opt/node-v0.10.17-linux-x64/bin
export PATH="$PATH":/opt/Sublime\ Text\ 2/
export PATH="$PATH":/opt/jdk1.6.0_45/bin
export PATH="$PATH":/opt/android-sdk-linux/tools
export ANDROID_NDK=/opt/android-ndk-r8d
export MOZILLA_FIVE_HOME=/usr/lib/mozilla
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"$MOZILLA_FIVE_HOME"
export PREFIX=/usr/local/etc
export PATH="$PATH":/opt/mongodb-linux-x86_64-2.4.8/bin
export PATH="$PATH":/usr/local/etc/bin
export PATH="./node_modules/.bin:$PATH"
