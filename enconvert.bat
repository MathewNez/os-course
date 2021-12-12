@echo off
if not exist "C:\Program Files (x86)\GnuWin32\bin\iconv.exe" (
	echo.
	echo Bro, this batch script needs libiconv installed in ur system at C:\Program Files (x86)\GnuWin32\bin\iconv.exe
	echo.
	echo Bro, you need to install iconv.
	echo.
	echo You can find it here:
	echo.
	echo http://gnuwin32.sourceforge.net/packages/libiconv.htm
	exit /b
)
if "%~1"=="" (
	echo Bro, looks like you have not passed any parameters.
	echo.
	echo If you need help, go and type "%0 /?"
	exit /b
)
if "%1" == "/?" (
	echo Hello my friend!
	echo.
	echo %0 is a script that converts all "*.txt" files from cp866 encoding to UTF-8.
	echo.
	echo.
	echo USAGE:
	echo 		%0 directory
	echo.
	echo where directory is a folder where you need to convert all the files, including files in subfolders.
	exit /b
)
if not exist %1\* (
	echo Bro, the %1 does not exist, or it's not a direcory.
	exit /b
)
set dir = %1
set tmp = "tmp"
for /R %dir% %%f in (*.txt) do (
	iconv -f cp866 -t utf-8 %%f > %tmp%.txt
	type %tmp%.txt > %%f
	del %tmp%.txt
	echo %%f done.
	echo.
)
echo All done, exiting...
exit /b