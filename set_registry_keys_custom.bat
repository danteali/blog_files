:: The included 'set_registry_keys.bat wouldn't work for me so I've thrown this together. It's a bit longer but it works.
:: Need to add edit registry commands for starting VLC with rc interface, and specified host:port
:: Arguments to be added: --extraintf=rc --rc-host=localhost:4222

:: Examples...
:::: AddToPlaylistVLC: "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" --extraintf=rc --rc-host=localhost:4222--started-from-file --playlist-enqueue "%1"
:::: Open: "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" --extraintf=rc --rc-host=localhost:4222--started-from-file "%1"
:::: PlayWithVLC: "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" --extraintf=rc --rc-host=localhost:4222 --started-from-file --no-playlist-enqueue "%1"

@echo off
setlocal enabledelayedexpansion

:::: ----------------------------------------------------------------------------------------
:::: This set of variables are also in the config.bat file. I've put them in here directly as 
:::: it doesn't work to just call the default config.bet file since some are incorrectly
:::: defined to work correctly e.g. ip andport have quotes which doesn't work for running
:::: REG ADD properly.
:::: ----------------------------------------------------------------------------------------

:::: Configuration to set the registry keys
:: Set the full path to the VLC exe file on your computer
:: No need for any quotes.
set vlc_path=C:\Program Files (x86)\VideoLAN\VLC\vlc.exe

:: Set the IP address VLC will listen to (default: localhost)
set ip=localhost

:: Set the port VLC will listen to (default: 4222)
set port=4222

:: Set the options you want to start VLC with. You should at least let
:: the default for remote control (--extraintf=rc --rc-host=ip:port
:: --rc-quiet)
set vlc_opts=--extraintf=rc --rc-host=%ip%:%port% --rc-quiet

:::: ----------------------------------------------------------------------------------------


:: Now need to set registry keys. For info, this command works from the command line
:::: REG ADD "HKCR\VLC.mp4\shell\AddToPlaylistVLC\test" /ve /t REG_SZ /d "\"C:\Program Files (x86)\VideoLAN\VLC\vlc.exe\" --extraintf=rc --rc-host=localhost:4222 --rc-quiet --started-from-file --playlist-enqueue \"%%1\"" /f

:: Couldn't get the original for loop to work. Everything I tried with loops wouldn't work so stuck with having a command per registry entry.
:: Set the file formats for which you want VLC to start listening to remote control for TraktForVLC to work. 
:: You need to set at the top of each set of commands. Add or remove blocks of commands to meet your needs.
:: Note: no trailing spaces.

set format=mp4
  REG ADD "HKCR\VLC.%format%\shell\AddToPlaylistVLC\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file --playlist-enqueue \"%%1\"" /f
	REG ADD "HKCR\VLC.%format%\shell\Open\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file \"%%1\"" /f
  REG ADD "HKCR\VLC.%format%\shell\PlayWithVLC\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file --no-playlist-enqueue \"%%1\"" /f
  
set format=avi
  REG ADD "HKCR\VLC.%format%\shell\AddToPlaylistVLC\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file --playlist-enqueue \"%%1\"" /f
	REG ADD "HKCR\VLC.%format%\shell\Open\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file \"%%1\"" /f
  REG ADD "HKCR\VLC.%format%\shell\PlayWithVLC\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file --no-playlist-enqueue \"%%1\"" /f

set format=mkv
  REG ADD "HKCR\VLC.%format%\shell\AddToPlaylistVLC\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file --playlist-enqueue \"%%1\"" /f
	REG ADD "HKCR\VLC.%format%\shell\Open\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file \"%%1\"" /f
  REG ADD "HKCR\VLC.%format%\shell\PlayWithVLC\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file --no-playlist-enqueue \"%%1\"" /f

set format=mov
  REG ADD "HKCR\VLC.%format%\shell\AddToPlaylistVLC\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file --playlist-enqueue \"%%1\"" /f
	REG ADD "HKCR\VLC.%format%\shell\Open\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file \"%%1\"" /f
  REG ADD "HKCR\VLC.%format%\shell\PlayWithVLC\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file --no-playlist-enqueue \"%%1\"" /f

set format=wmv
  REG ADD "HKCR\VLC.%format%\shell\AddToPlaylistVLC\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file --playlist-enqueue \"%%1\"" /f
	REG ADD "HKCR\VLC.%format%\shell\Open\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file \"%%1\"" /f
  REG ADD "HKCR\VLC.%format%\shell\PlayWithVLC\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file --no-playlist-enqueue \"%%1\"" /f

set format=ts
  REG ADD "HKCR\VLC.%format%\shell\AddToPlaylistVLC\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file --playlist-enqueue \"%%1\"" /f
	REG ADD "HKCR\VLC.%format%\shell\Open\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file \"%%1\"" /f
  REG ADD "HKCR\VLC.%format%\shell\PlayWithVLC\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file --no-playlist-enqueue \"%%1\"" /f

set format=mpg
  REG ADD "HKCR\VLC.%format%\shell\AddToPlaylistVLC\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file --playlist-enqueue \"%%1\"" /f
	REG ADD "HKCR\VLC.%format%\shell\Open\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file \"%%1\"" /f
  REG ADD "HKCR\VLC.%format%\shell\PlayWithVLC\command" /ve /t REG_SZ /d "\"%vlc_path%\" %vlc_opts% --started-from-file --no-playlist-enqueue \"%%1\"" /f






