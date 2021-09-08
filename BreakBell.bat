@echo off
echo SCHOOL BELL
echo.
echo Today is %date%

REM In this section you can set the time you need the bell to ring.
REM b1start stands for "Break 1 start", but you can name it whatever you like.
REM You can set as many bells as you need, just add a new line with this structure:
REM set bellName="HH:MM"
REM Then you will need to add it in the :time section.

:CONFIG
set b1start="09:30"
set b1end="09:45"
set b2start="11:45"
set b2end="12:00"
set exit1="13:00"
set exit2="14:00"

REM If you add a line, you can also add it to this list manually. This DOES NOT affect anything, it just shows on
REM screen a message. For example, you can write this line:
REM echo Lunch time    %lunchBellname%
REM and it will be printed on screen.

:print
echo.
echo Programmed:
echo.
echo 1st break 	%b1start% - %b1end%
echo 2nd break  	%b2start% - %b2end%
echo Exit 		%exit1%
echo Exit 		%exit2%

REM This section loops endlessly and compares the current time and if it matches the one you set on the :CONFIG section
REM it jumps to :BELL. If you add a line in :config, you will need to add it here too with this structure:
REM if /i "%time:~0,5%"==%bellName% goto bell and replace bellName with whatever you chose earlier.

:time
	if /i "%time:~0,5%"==%b1start% goto bell
	if /i "%time:~0,5%"==%b1end% goto bell
	if /i "%time:~0,5%"==%b2start% goto bell
	if /i "%time:~0,5%"==%b2end% goto bell
	if /i "%time:~0,5%"==%exit1% goto bell
	if /i "%time:~0,5%"==%exit2% goto bell


	timeout>nul 1
	goto time


:bell
	echo.
	echo BELL %time:~0,5%
	powershell -c (New-Object Media.SoundPlayer "C:\Bell.wav").PlaySync();
	goto time

pause
