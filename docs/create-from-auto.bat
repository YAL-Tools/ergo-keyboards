@echo off
setlocal enabledelayedexpansion

set "inputDir=img-auto"
set "outputDir=img"
set "targetWidth=1280"

if not exist "%outputDir%" mkdir "%outputDir%"

for %%i in ("%inputDir%\*.*") do (
	set "inputFile=%%i"
	set "outputFile=%outputDir%\%%~ni.webp"
	
	magick convert "!inputFile!" -resize %targetWidth%x -quality 80 "!outputFile!"
	del /Q !inputFile!
	echo Converted !inputFile! to !outputFile!
	
)

echo OK!
