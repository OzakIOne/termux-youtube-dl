#!/bin/bash
#if number of video is numeric, then continue with audio select.  if entry is c, then use
#315  yt-dlp -f "b" -S "filesize~8M" https://www.youtube.com/watch?v=sNZlayePt70
#316  yt-dlp -f "b" -S "filesize~10M" https://www.youtube.com/watch?v=sNZlayePt70
#317  yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b" -S "filesize~10M" https://www.youtube.com/watch?v=sNZlayePt70
#318  yt-dlp -F https://www.youtube.com/watch?v=36XSU8sYmIY
#319  yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b" -S "filesize~20M" https://www.youtube.com/watch?v=36XSU8sYmIY

#4chan dl 4meg max/webm 
#yt-dlp -f "bv*[ext=webm]+ba[ext=webm]/b[ext=webm] / bv*+ba/b" -S "filesize~4M" https://www.youtube.com/watch?v=36XSU8sYmIY

clear
num_re='^[0-9]+$'
if [[ "$1" =~ ^.*youtu.*$ ]] || [[ "$1" =~ ^.*youtube.*$ ]]; then
    echo -e "Downloading video...\\n>URL: ${1}\\n"
    yt-dlp -F "$1"
    echo -p "Choose your video quality (press enter for: 'best' or 'c' for 4chan limit (webm/4MB), "
    read -p "or enter 'd' for discord limit (mp4/8MB) or video format literal value above: " video
    read -p "Choose your audio quality (press enter for: 'best') : " audio
    if [[ "$video" = "" ]]; then
        video="best"
    fi
    if [[ "$audio" = "" ]]; then
        audio="best"
    fi
    yt-dlp -f "$video"+"$audio" "$1"
    elif [[ "$1" =~ ^.*nourlselected.*$ ]]; then
    echo "There was an error"
else yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' "$1"
fi

read -p "Press enter to continue"


#https://www.youtube.com/watch?v=FrevA9SVPN4
# ironmouse video.  < 4MB 135 or 244 for vid, 251 or 140 for audio
#yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b" -S "filesize~4M" https://www.youtube.com/watch?v=FrevA9SVPN4
#yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b" -S "filesize~8M" https://www.youtube.com/watch?v=FrevA9SVPN4