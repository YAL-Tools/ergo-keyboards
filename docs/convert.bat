@echo off
setlocal enabledelayedexpansion

set "inputDir=img"
set "outputDir=img-small"
set "targetWidth=320"

if not exist "%outputDir%" mkdir "%outputDir%"

for %%i in ("%inputDir%\*.*") do (
	set "inputFile=%%i"
	set "outputFile=%outputDir%\%%~ni.webp"
	
	if not exist "!outputFile!" (
		magick convert "!inputFile!" -resize %targetWidth%x -quality 80 "!outputFile!"
		
		echo Converted !inputFile! to !outputFile!
	)
)

echo OK!
