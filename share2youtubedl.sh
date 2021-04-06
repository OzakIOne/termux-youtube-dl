#!/bin/bash
clear

if [[ "$1" =~ ^.*youtu.*$ ]] || [[ "$1" =~ ^.*youtube.*$ ]]; then
  echo -e "Downloading video...\\n>URL: ${1}\\n"
  youtube-dl -F "$1"
  read -p "Choose your video quality (press enter for: 'best') : " video
  read -p "Choose your audio quality (press enter for: 'best') : " audio
  if [[ "$video" = "" ]]; then
    video="best"
  fi
  if [[ "$audio" = "" ]]; then
    audio="best"
  fi
  youtube-dl -f "$video"+"$audio" "$1"
elif [[ "$1" =~ ^.*nourlselected.*$ ]]; then
  echo "There was an error"
else youtube-dl -f best "$1"
fi

read -p "Press enter to continue"
