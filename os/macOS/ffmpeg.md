# FFMPEG to HEVC

```bash
# for i in *.avi; do ffmpeg -i "$i" "${i%.*}.mp4"; done
ffmpeg -i input -c:v libx265 -crf 21 -c:a aac -b:a 128k -f mp4 -pix_fmt yuv420p -tag:v hvc1 -movflags faststart output.mp4
touch -r input output.mp4
```

## Sources

- https://danconnor.com/posts/21d8bd7c22f6ae6b423c3c09/how_to_encode_h_265_hevc_video_that_will_play_in_quicktime_on_macos_using_ffmpeg_
