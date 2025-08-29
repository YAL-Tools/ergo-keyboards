#!/bin/bash
for inputPath in img/*.*; do
	inputFile=${inputPath##*/}
	outputFile=${inputFile%.*}.webp
	outputPath=img-small/$outputFile
	if [ ! -f "$outputPath" ]; then
		magick "$inputPath" -resize 320x -quality 80 "$outputPath"
		echo Converted $inputFile to $outputFile
	fi
done
echo OK!