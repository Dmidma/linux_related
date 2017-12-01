#### Ranger:

It's a file manager.

> Start by installing it and open it. (Easy to do).



The config file will be in `~/.config/ranger/rc.conf`.

If you don't have it copy it you can copy the default one from `/etc/ranger/config/`.

In the config file, we can make a lot of shortcuts and commands.

Eg.
```
map gd cd ~/Documents
map td tab_new ~/Documents
map md shell mv %%s ~/Documents
map Yd shell cp %%s ~/Documents
```

> `%%s`: all selected files.


> See how to config and optimize this.

> Bulk Renaming with vi!




To enable the images preview, go to the config file and set `preview_iamges` to __true__.



