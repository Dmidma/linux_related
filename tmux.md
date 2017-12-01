### Intro:

__tmux__ is __Terminal Multiplexer__.  
Simply, it acts as window manager within your terminal.

> Within one terminal window you can open multiple windows and split-views: __panes__.

Each pane wil contain its own terminal instance.  
Tmux keeps the windows and panes in a __session__.  
You can exit a session whenever you want: __detaching__. The session will remain alive until you kill the tmux server.

> Tmux based on a client-server architecture.
> Tmux server keeps track of all running sessions.
> User will work with tmux client, create new sessions, connect to existing ones, ...


You can pick any session from where you left it by __attaching__ to that session.


> Tmux is very helpful for remote machines.


### Getting Started:

* Install it:
```
$ sudo apt-get install tmux
```

* run it:
```
$ tmux
```

This creates a new tmux session.

The terminal now has a status bar at the bottom which _can be customized_.


#### Splitting Panes:

All commands in tmux are triggered by a __prefix key__ followed by a __command key__.

* Prefix Key: `C-b`.

> C-b: pressing `ctrl` and `b` keys at same time.


* Horizantal split: `C-b %`.
* Vertical split: `C-b "`.


#### Scrolling in Terminal:

* To enter scroll mode: `C-b [`.
* To exist scroll mode: `q`

* Jump up one page: `C-b PgUp`.



#### Navigating Panes:

* To navigate between panes: `C-b <arrow key>`.

* To display the pane numbers: `C-b q`.

#### Closing Panes:

* To close a pane: 
    - `exit`
    - `C-d`

* To close a pane with a prompt:
    - `C-b x`

#### Creating Windows:

* Creating a new window: `C-b c`.
* Switching to _next_ window: `C-b n`.
* Switching to _previous_ window: `C-b p`.
* Swithcing to _specific_ windoow: `C-b <number>`

> To close current window: `Prefix &`


#### Session Handling:

Exiting all panes will result in closing the session.  
You can keep the session in the background for later user by detaching it.

* Detaching current session: `C-b d`

> Also can use `C-b D` to choose which sessions to detach. 


* List all running sessions:
```
$ tmux ls
```

* Connect a session:
```
$ tmux attach -t <index_session>
```

* Create a session with a name:
```
$ tmux new -s <name>
```

* Rename an existing session:
```
$ tmux rename-session -t <index_session> <name>
```

> You can `attach` a session by its __name__.


Eg.
```
$ tmux rename-session -t 0 database
$ tmux attach -t database
```

#### More:


* List of possible commands: `C-b ?`.
* Toggle full screen of a pane: `C-b z`.
* Resize a pane: `C-b C-<arrow key>`.
* Rename current window: `C-b ,`.
* No automatic renaming, in config file: `set-option -g allow-rename off`


#### Switching Panes:


We can use `Alt` key plus a direction to switch panes:
```
# switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
```





### From Book:


* Version: 
```
$ tmux -V
```

* Create a new session in the backgroud: 
```
$ tmux new -s <session_name> -d
```

* Create a new session and window with names:
```
$ tmux new -s <session_name> -n <window_name>
```

* Killing Sessions: 
```
$ tmux kill-session -t a_session
```

* Find a window by name: `C-b f`.
* A menu for all windows: `C-b w`.
* Kill a window with a prompt: `C-b &`.


#### Pane Layouts:

We can resize the panes using templates.  
Default tampltes:
* __even-horizontal__: All panes horizontally, left to right.
* __even-vertical__: All panes vertically, top to bottom.
* __main-horizontal__: One large pane on the top and smaller panes underneath.
* __main-vertical__: One large pane on the left side and stacks the rest vertically on the right.
* __tiled__: All panes evenly on the screen.

To cycle between them: `C-b SpaceBAR`.


#### Command Mode:

To enter command mode: `C-b :`.

List of commands:
    * `new-window -n <name>`.

Eg.
```
:new-window -n process "top"
```
This will open a new window and run __top__ program in it.  
If the program is exited, the window will automatically close.


### Configuring tmux:

First thing to do is:
```
$ touch ~/.tmux.conf
```

To change the __prefix key__, add this to the configuration file:
```
set -g prefix C-a
```


> To validate the changes: `:source-file ~/.tmux.conf`.


To set the delay of keystrokes:
```
set -sg escape-time 1
```


To change the base index for windows and panes respectively:
```
setw -g base-index 1
setw -g pane-base-index 1
```

> `setw` is a shorthand for `set-window-option`.


#### Shortcut:

We can set different shortcuts:

* Reload the configuration file:
```
bind r source-file ~/.tmux.conf \; display "Reloaded!"
```
The _display_ part will allow us to notice the change.


> Combine multiple commands with `\;` character.


We can even define keybindings without the `PREFIX`.  
Using `bind-key -n` will tell tmux to ignore the `PREFIX`.

Eg.
```
bind-key -n C-r source-file ~/.tmux.conf
```

> Use this with care because anyother application using that shortcut will be ignored.


If another application uses the same keystores we can send the prefix by pressing it twice:
```
bind C-a send-prefix
```

We can shortcut the way panes are splitted:
```
bind | split-window -h
bind - split-window -v
```

We can make shortcuts to cycle around the windows:
```
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+
```


### Visual Styling:


See tmux pdf page 32/82




See [github link](https://gist.github.com/MohamedAlaa/2961058)
Also [this](https://wiki.archlinux.org/index.php/tmux)























