import argparse
import os
import yt_dlp
from tqdm import tqdm

def download_as_audio(url, output_folder, audio_format, audio_quality):
    
    options = {
        'format': 'bestaudio/best',
        'extractaudio': True,
        'audioformat': audio_format,
        'outtmpl': f'{output_folder}/%(title)s.%(ext)s',
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': audio_format,
            'preferredquality': audio_quality,
        }],
        'no_warnings': True, # will suppress warnings
    }

    with yt_dlp.YoutubeDL(options) as ydl:
        ydl.download([url])

def download_as_video(url, output_folder, video_format, video_quality):
    
    options = {
        'format': 'bestvideo[ext='+video_format+']+bestaudio[ext=m4a]/best[ext='+video_format+']/best',
        'outtmpl': f'{output_folder}/%(title)s.%(ext)s',
        'merge_output_format': video_format,
        'no_warnings': True, # will suppress warnings
    }

    with yt_dlp.YoutubeDL(options) as ydl:
        ydl.download([url])

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Download audio or video from YouTube videos.')
    parser.add_argument('type', type=str, choices=['audio', 'video', 'both'], help='Type of download')
    parser.add_argument('url', type=str, help='URL of the YouTube video')
    parser.add_argument('--audio-format', type=str, default='mp3', help='Audio format (mp3 or wav)')
    parser.add_argument('--audio-quality', type=str, default='320', help='Audio quality (320kbps for mp3, 44.1khz 16 bit for wav)')
    parser.add_argument('--video-format', type=str, default='mp4', help='Video format (mp4 or mkv)')
    parser.add_argument('--video-quality', type=str, default='720', help='Video quality (720p, 1080p, etc.)')
    parser.add_argument('--output', type=str, default='Youtube_Downloads', help='Output folder')
    args = parser.parse_args()

    if not os.path.exists(args.output):
        os.makedirs(args.output)

    if args.type == 'audio':
        download_as_audio(args.url, args.output, args.audio_format, args.audio_quality)
    elif args.type == 'video':
        download_as_video(args.url, args.output, args.video_format, args.video_quality)
    else:
        download_as_audio(args.url, args.output, args.audio_format, args.audio_quality)
        download_as_video(args.url, args.output, args.video_format, args.video_quality)
    