export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export PATH=$PATH:~/bin:~/.cabal/bin:~/Projects/gocode/bin
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi
if [[ $(uname -m) == "i686" ]]; then
	source /opt/intel/composerxe/bin/compilervars.sh ia32
	source /opt/intel/mkl/bin/mklvars.sh ia32 mod
else
	source /opt/intel/composerxe/bin/compilervars.sh intel64
	source /opt/intel/mkl/bin/mklvars.sh intel64 mod lp64
fi
export LIBRARY_PATH=$LIBRARY_PATH:../lib
export CPATH=$CPATH:$INCLUDE:../lib
export GOPATH=~/Projects/gocode
ulimit -s unlimited
export OMP_STACKSIZE="1G"
if tty | grep pts > /dev/null; then
	#if not inside a tmux session, and if no session is started, start a new session
	test -z "$TMUX" && (tmux attach || tmux new-session)
fi
