export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export PATH=$PATH:~/bin:~/.cabal/bin:~/Projects/gocode/bin:~/.multirust/toolchains/nightly/cargo/bin/:~/.cargo/bin
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi
#if [[ $(uname -m) == "i686" ]]; then
	#source /opt/intel/composerxe/linux/bin/compilervars.sh ia31
	#source /opt/intel/composerxe/linux/mkl/bin/mklvars.sh ia32 mod
#else
	#source /opt/intel/composerxe/linux/bin/compilervars.sh intel64
	#source /opt/intel/composerxe/linux/mkl/bin/mklvars.sh intel64 mod lp64
#fi
#source /opt/intel/vtune_amplifier_xe_2016.3.0.463186/amplxe-vars.sh >/dev/null
#source /opt/intel/composerxe/linux/mpi/bin64/mpivars.sh intel64
export LIBRARY_PATH=$LIBRARY_PATH:../lib:../lib/nlopt/lib
export CPATH=$CPATH:$INCLUDE:../lib:../lib/nlopt/include
#export GOPATH=~/Projects/gocode
export GOPATH=~/go
export RUST_SRC_PATH=~/.multirust/src
ulimit -s unlimited
export OMP_STACKSIZE="1G"
export EDITOR=nvim
#if tty | grep pts > /dev/null; then
	##if not inside a tmux session, and if no session is started, start a new session
	#test -z "$TMUX" && (tmux attach || tmux new-session)
#fi
export TERM=xterm-256color
#export http_proxy=http://user:pass@114.212.200.3:64143/
#export https_proxy=http://user:pass@114.212.200.3:64143/
#export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
#export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
#export LD_LIBRARY_PATH=/usr/lib/openmpi/:$LD_LIBRARY_PATH
#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  #exec startx
#fi
#source /etc/modules/init/zsh
