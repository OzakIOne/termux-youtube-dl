# termux-youtube-dl

Bash script to setup yt-dlp in termux

## How to install

1. Download [termux](https://play.google.com/store/apps/details?id=com.termux)
   > It seems that the playstore version is not up to date and can cause some bugs like packages not updating, you may try the [last fdroid version](https://f-droid.org/en/packages/com.termux/) (0.117.117 as the time i'm writing this)
2. Open termux & copy paste this :

   `curl -L https://raw.githubusercontent.com/OzakIOne/termux-youtube-dl/v1.0.3/install.sh | bash`

## How to use

1. Now go into youtube (or twitter, or reddit, [full list](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md) / [raw txt](https://raw.githubusercontent.com/yt-dlp/yt-dlp/master/supportedsites.md)), watch a video, tap the share button, then tap termux and wait for the download
2. Go into `/storage/emulated/0/Youtube-DL` with your file explorer and watch your downloaded video
