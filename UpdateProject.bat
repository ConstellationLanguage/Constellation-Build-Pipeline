@RD /S /Q %~dp0BuildProject\Constellation

set rootDisplay = %~dp0


cd %~dp0Repositories\ConstellationFlappyBird
set HOME=%USERPROFILE%
git pull origin master


cd %~dp0Repositories\ConstellationMaster
set HOME=%USERPROFILE%
git pull origin master


setlocal

Echo D | xcopy /e /s %~dp0Repositories\ConstellationFlappyBird\FlappyBird\Assets\FlappyBirdExample %~dp0BuildProject\Constellation\Assets\FlappyBirdExample

Echo D | xcopy /e /s %~dp0Repositories\ConstellationMaster\Constellation\Assets\Constellation %~dp0BuildProject\Constellation\Assets\Constellation

"C:\Program Files\Unity2017.4.2\Editor\Unity.exe" -quit -projectPath %~dp0BuildProject\Constellation -executeMethod BuildPackage.ExportPackage

Echo D | xcopy /e /s %~dp0Repositories\AssetStoreTools %~dp0BuildProject\Constellation\Assets\AssetStoreTools

"C:\Program Files\Unity2017.4.2\Editor\Unity.exe" -projectPath %~dp0BuildProject\Constellation

