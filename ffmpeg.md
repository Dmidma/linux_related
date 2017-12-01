### ffmpeg:


Video converter, screencaster, webcamming, ...


The syntaxt is very easy:
```
$ ffmpeg -i <input> <output>
```

If we want to record the screen we can:
```
$ ffmpeg -f x11grab -s 1600x1050 -i :0.0 out.mkv
```

* `x11grab`: for the default screen.
* `:0.0`: for the first screen.
* `-s`: for the recording size (start from the left-top corner).

> _Screen size_ always before _input_.


> You can know your screen dimensions with: `$ xdpyinfo | grep 'dimensions:'`

You can use this like:
```
-s $(xdpyinfo | grep dimensions | awk '{print $2;}')
```


Webcams are stored in `/dev/video*`.
We can record video from webcam:
```
$ ffmpeg -y -i /dev/video0 out.mkv
```

* `-y`: yes for everything.


You can record the sound with the video using:
```
$ ffmpeg -y -f x11grab -s 1900x1080 -i :0.0 -f alsa -i default out.mkv
```

* __alsa__ is Advanced Linux Sound Architecture.

You can list your sound devices:
```
$ arecord -l
```

> You should set the input device you want to use as default to be able to use `alsa -i default`, else you need to specify the device.


You can also specify the codex for the recording:
```
-c:v libx264 -r 30 -c:a flac
```


Instead of using the mic, you can set as an input a music file:
```
-i music.flac
```


> You can use ffmpeg to record audio without recording video.


> Configs and scripts can be found [here](https://github.com/LukeSmithxyz)
