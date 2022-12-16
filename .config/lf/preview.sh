#!/bin/sh

case $(file --mime-type -Lb "$1") in
	application/x-tar) tar tf "$1";;
	application/zip) unzip -l "$1";;
	application/vnd.rar) unrar l "$1";;
	application/x-7z-compressed) 7z l "$1";;
	application/pdf) pdftotext "$1" -;;
	text/*) less "$1";;
	*) echo "Unsupported file type";;
esac
