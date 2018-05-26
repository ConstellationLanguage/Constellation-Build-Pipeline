del /s /q %~dp0BuildProject\Constellation

set rootDisplay = %~dp0

cd %~dp0Repositories\ConstellationFlappyBird
set HOME=%USERPROFILE%
git pull origin master

cd rootDisplay

cd %~dp0Repositories\ConstellationMaster
set HOME=%USERPROFILE%
git pull origin master


cd rootDisplay

setlocal

rem Define base folder to Processing
set TopLevel= %~dp0BuildProject

rem process each folder contained in base folder
for /d %%t in ("%TopLevel%\*.*") do (
    rem Display folder currently being processed
	echo Processing '%%~t' ...

    rem remove files older than one day from this folder
    rem *** add /s option to pure old files in all subfolders as well ***
    forfiles /p "%%~t" /d -1 /c "cmd /c del /s @path"

    rem Remove any empty folders below thus user folder
	for /f "delims=" %%i in ('dir /s /b /ad "%%t" ^| sort /r') do (rd "%%~i" >NUL
    )
)

xcopy /s %~dp0Repositories\ConstellationFlappyBird\FlappyBird\Assets\FlappyBirdExample %~dp0BuildProject\Constellation\Assets\FlappyBirdExample

xcopy /s %~dp0Repositories\ConstellationMaster\Constellation\Assets\Constellation %~dp0BuildProject\Constellation\Assets\Constellation

xcopy /s %~dp0Repositories\ConstellationMaster\Constellation\Assets\Gizmos %~dp0BuildProject\Constellation\Assets\Constellation
