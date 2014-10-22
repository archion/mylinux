export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export PATH=$PATH:~/bin:~/.cabal/bin
export CPATH=$CPATH:/opt/intel/mkl/include/ia32:../lib
export LIBRARY_PATH=$LIBRARY_PATH:../lib
ulimit -s unlimited
if tty | grep pts > /dev/null; then
	#if not inside a tmux session, and if no session is started, start a new session
	test -z "$TMUX" && (tmux attach || tmux new-session)
fi
