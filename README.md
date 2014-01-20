This is the dotsfile in my archlinux's home directory include:
- vim
- zsh
- mplayer
- zathura
- razor-qt
- compiz
- tmux
- rtorrent
- conky
- emerald themes settings
- deadbeef
- tilda
- gtk and qt themes settings
- xwindow file settings
- and defaults app settings

Usage:
backup home directory setting file list in filelist to mylinux directory:
```
rsync -av --files-from=`echo ~`/mylinux/filelist ~ ~/mylinux
```
push mylinux directory setting file to home directory:
```
rsync -av --files-from=`echo ~`/mylinux/filelist ~/mylinux ~
```
