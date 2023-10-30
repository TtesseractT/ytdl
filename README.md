# ytdl
Youtube Downloader 

## Installation

### Option 1. One click easy installation
<a href="https://github.com/TtesseractT/setup.bat" download>
  <img src="https://img.shields.io/badge/.bat-download-blue?style=flat-square&logo=windows" alt="Download .bat">
</a>

# YouTube Video and Audio Downloader

This Python script allows you to download audio or video from YouTube videos. It uses the `yt_dlp` library to handle the downloads.

## Prerequisites

Before using this script, make sure you have the following installed:

- Python 3
- `yt_dlp` library: You can install it using pip: `pip install yt-dlp`

## Usage

Run the script from the command line using the following syntax:

```bash
ytdr <type> {YT_URL}
```

or run the script direct. Using the following.

```bash
python youtube_downloader.py <type> <url> [--audio-format <audio_format>] [--audio-quality <audio_quality>] [--video-format <video_format>] [--video-quality <video_quality>] [--output <output_folder>]
```

```bash
<type>: Type of download. Choose from audio, video, or both.
<url>: URL of the YouTube video you want to download.
```

Argparse Commands

```bash
--audio-format <audio_format>: (Optional) Audio format, default is mp3. Choose from mp3 or wav.
--audio-quality <audio_quality>: (Optional) Audio quality, default is 320. Specify the desired quality (e.g., 320 for mp3, 44100:16 for wav).
--video-format <video_format>: (Optional) Video format, default is mp4. Choose from mp4 or mkv.
--video-quality <video_quality>: (Optional) Video quality, default is 720. Specify the desired quality (e.g., 720p, 1080p, etc.).
--output <output_folder>: (Optional) Output folder for downloaded files, default is Youtube_Downloads.
```
