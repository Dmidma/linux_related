Linux Command Line and Shell Scripting Bible.


```
$ setterm -inversescreen on
```

You can also turn it off by using the **off** option.


```
$ setterm -foreground black
$ setterm -background white
```
The colors can be changed to include:
	* black
	* red
	* green
	* yellow
	* blue
	* magenta
	* cyan
	* white

`-reset` changes the terminal appearance back to default.
`-store` saves the current configuration.

You can use different terminal emulators:
	* gnome-terminal
	* konsole
	* xterm



You can search the man pages using keywords.
```
$ man -k keyword
```

The man page provide different sections which are represented by numbers:

Section Number | Area Contents
---------------|--------------
1 | Executable programs or shell commands
2 | System calls
3 | Library calls
4 | Special files
5 | File formats and conventions
6 | Games
7 | Overviews, conventions, and miscellaneous
8 | Super user and system administration commands
9 | Kernel routines


When you `man` something, at the right-top corner you will find the name of that thing followed by a number in parentheses.

Occasionally, a command has many pages in multiple section content areas.
To see a specific page: `$ man section# topic`.
Eg.
```
$ man 1 hostname
$ man 7 hostname
```

Most commands accept the `-help` or `--help` flags.


#### ps:

`-u userlist`: shows processes related to one of the users in the userlist.
`-j`: Shows job information.
`-p pidlist`: Shows processes with PIDs in the list pidlist.
`-e`: Shows all processes.
`-f`: Do full format.
`--forest`: Shows the nesting of the subshells.


 #### du:

`-s`: Summarizes everything
`-c`: Produces



#### Understanding the Shell:

The shell program that the system starts depends on your user ID configuration.
In the `/etc/passwd` file, the user ID has its default shell program listed in #7 field.

```
$ cat /etc/passwd | grep ‘^dmidma’
```

The default interactive shell started when a user logs into a virtual console terminal or starts a terminal emulator in the GUI.  
This is the _Parent Shell_.

When the /bin/bash or equivalent bash command in entered at the CLI prompt, a new shell program is created.
This is the _Child shell_.  
The child shell also has a CLI prompt and waits for commands to be entered.


If you run child shells and run:
```
$ ps -f
```
You will see the child shells listed.

If you run other commands in the child shell and re-run the above command you will find that the new run commands have the __PID__ of the child child as their __PPID__.



The bash command can also take some flags:

parameter | Description
----------|-------------
-c string | Reads commands from string and processes them
-i | Starts an interactive shell, allowing input from the user
-l | Acts as if invoked as a login shell
-r | Starts a restricted shell, limiting the user to the default directory
-s | Reads commands from the standard input


Typing `exist` will exit the child 

> Another way a subshell can be created is when you run a shell script.


#### Process Lists:

You can create a process list:
```
$ (pwd ; ls ; cd /etc ; pwd ; cd ; pwd ; ls)
```
The list of command will be run in a subshell.  

> A process list must be encased in parentheses.
To see the difference you can run these two commands:
```
$ pwd ; ls ; cd /etc ; pwd ; cd ; pwd ; ls ; echo $BASH_SUBSHELL
$ (pwd ; ls ; cd /etc ; pwd ; cd ; pwd ; ls ; echo $BASH_SUBSHELL)
```


You can also create a grandchild subshell by embedding parentheses within a process list:
```
$ (pwd ; (echo $BASH_SUBSHELL))
```
This will display *2* instead of *1* as the previous command.


#### Co-Processing:

This performs almost identically to putting a command in background mode, except for the fact that it creates a subshell.

You can give it a name or omit the name to give it __COPROC__ default name.

```
$ coproc My_Job { sleep 10; }
```

Be careful using the extended syntax, the formating is very strict: 
{ command ; …; }


Eg of command =D;
```
$ coproc my_chats { telegram & slack & viber; }
```


#### External Commands:

It’s important to understand both:
	- shell built-in
	- shell non-built-in (external)


External commands (filesystem commands), are usually located in:
	- `/usr/bin`
	- `/sbin`
	- `/usr/sbin`


You can use `type -a command` to figure out its filename.


Whenever an external command is executed, a child process is created.  
This is called _forking_.


When we execute the `ps` command and since it is an external command, a child process is created.  
That’s why if you run `ps -f` you will find that __PPID__ of that command matching the __PID__ of the current bash.

![foking](./imgs/forking.png)

Whenever a process must fork, it takes time and effort to set up the new child process’s environment.
Thus, external commands can be a little expensive.


Forking a child process or creating a subshell, you can still communicated with it via _signaling_.


> Using built-in commands, no forking is required.

Eg.:
$ type cd
cd is a shell builtin



Some commands have multiple flavors.
Eg.:
$ type -a echo
echo is a shell builtin
echo is /bin/echo

> `type -a` shows both types for a command, where `which` shows only the external command file.


To use the external command for a command that has multiple flavors, use the full path of it.



#### History command:

HISTSIZE: environment variable that contains the number of commands that you can save in bash history.

To reuse the last used command: `!!`.

Command history is kept in: `~/.bash_history` file.
The bash command history is stored in memory and then written out into history file when the shell is exited.  
You can use: `$ history -a` to write what’s in memory into the file.

The `~/.bash_history` file is read only once when a terminal session is first started.
You can use `$ history -n` to reread the file once again.


#### aliases:

To list all available aliases: `$ alias -p`.



#### Environment Variables:

There are two types:
	- Global variables
	- Local variables


Global environment variables are visible from the shell session and from any spawned child subshells.
Local ones are available only in the shell that creates them.

To view __global__ environment variables:
```
$ printenv
$ env
```

To print a specific variable:
```
$ printenv HOME
$ echo $HOME
```

You can also use the variables by preceding the name of the variable by __$__.

 
You can only see the local variables by using `$ set` which will display all environment variables.  
This command will sort the variables alphabetically.




When you are using local variables you need to use lowercase characters.
Eg.
my_variable=”Hello”
echo $my_variable

> Don’t use spaces between variable names, assignments, and values.


If you set a local variable and you spawn another shell, that variable won’t be available in the child shell.


To set a global environment variable we need to use `$ export`.
Eg.
```
$ my_variable=”Hello world”
$ export my_variable
```

> Child shells can use the global variables.
> Changing a global environment variable within a child shell does not affect the variable in the parent shell.
> You can not use the `export` to change the parent shell’s global environment vars.


To remove the environment variable:
```
$ unset my_variable
```

If you unset a global variable in a child shell, it will only be removed in the child shell.


> If you are doing anything _with_ the variable, use $
> If you are doing anything to _to_ the variable, don’t use $


> When not in use, the default environment variables are not all required to contain a value.





The __PATH__ environment variable defines the directories where to find the external commands.  
If a command’s or program’s location is not included in the __PATH__ variable, the shell cannot find it without an absolute directory reference.



##### Trick:

If you want to add the path of you program to __PATH__ variable, you need to go inside the directory and:
```
$ PATH=$PATH:.
```


#### Login shell process:

The first time you login, you will have a _login shell_.  
The login shell looks for 5 different startup files:
	* /etc/profile
	* $HOME/.bash_profile
	* $HOME/.bashrc
	* $HOME/.bash_login
	* $HOME/.profile


The 1st file is the main default startup file for the bash shell on the system.  
All users on the system execute this startup file when they log in.


> Some Linux distributions use __Pluggable Authentication Modules (PAM)__.
> Before the bash shell is started, PAM files are processed, including ones that may contain environment variables.

Eg. of PAM files:
	- /etc/environment
	- $HOME/.pam_environment

In the __/etc/profile__ we have a loop that runs every __.sh__ script in __/etc/profile.d__ directory.


> __.csh__ files are used for the c shell.
> __.sh__ files are used for the bash shell.



The 4 other files are specific for each user and can be customized.  
Not all 4 files can exist for every user. For example, some users may have only the $HOME/.bash_profile.



#### Interactive shell process:

If you start a bash shell without logging into a system (typing `bash` at a CLI prompt for example), you start an _interactive shell_.  
The interactive shell still provides a CLI prompt for you to enter commands.


If `bash` is started as an interactive shell, it doesn’t process the `/etc/profile` file. Instead, it only checks for the `.bashrc` file.

The `.bashrc` file checks for a common bashrc file in the /etc directory.  



#### Non-interactive shell process:

This is the shell where the system can start to execute a shell script.  
No CLI to worry about, however, you want to run specific startup commands each time you start a script on your system.

When the shell starts a non-interactive subshell process, it checks the __BASH\_ENV__ variable for the startup file name to execute.  
If one is present, the shell executes the file’s commands, which typically include variables set for the shell scripts.



> The best place to store an individual user’s persistent bash shell variables is in the `$HOME/.bashrc` file.
> If the `BASH_ENV` is set, keep in mind that unless it points to $HOME/.bashrc, you many need to store a user’s variables for non-interactive shell types elsewhere.



#### Variable Arrays:

To use an array variable:
```
$ mystest=(one two three four five)
```

If you display the variable (echo $mystes) will get the first element of the array.

```
$ echo ${mystes[2]}
three
```

To display an entire array variable:
```
$ echo ${mytest[*]}
```

You can change the value of an individual index position:
```
$ mytest[2]=seven
```

You can remove the value of an index position:
```
$ unset mytest[2]
```

This will only remove the value but not the place!

To remove the whole array:
```
$ unset mystest
```



#### /etc/passwd and /etc/shadow file:

Matches a __UID__ to a login name.

The _root_ user has 0 as UID.

The System create lots of user accounts for various functions, which they are called _system accounts_.  
They are used to gain access to resources on the system.  
All services that run in background mode need to be logged in to the system under a _system user account_.

The fields of this file are:
    
    - login username
    - password
    - UID
    - GID
    - text description (comment field)
    - HOME directory
    - default shell

Old versions of Linux stored the password in the _password field_. Now it is only a __x__.  
Now the password are stored in the `/etc/shadow` and only special program can access it. (As `login` program).

If the `/etc/passwd` file becomes corrupt, the system (even the root) can't logging in.


It contains a record for each user account on the system.

```
rich:$1$.FfcK0ns$f1UgiyHQ25wrB/hykCn020:11627:0:99999:7:::
```

The fileds:

    * login name
    * encrypted password
    * number of days since January 1, 1970, that the password was last changed
    * minimum number of days before the the password can be changed
    * number of days before the password must be changed
    * number of days before password expiration that the user is warned to change the password
    * number of days after a password expires before the account will be disabled
    * date since the user account was disabled
    * field reserved for future use



#### Managing a new User 

##### Adding:

The tool to add a new user: `useradd`.

> The system defaults are set in the `/etc/default/useradd`.

To see the default values on your linux distribution:
```
$ useradd -D
```
This shows what defaults will be used if you don't specify them in the command line when creating a new user account.

The new user will have:

* The HOME directory in `/home/loginname`.
* Default shell is `/bin/sh`.
* The system copies the contents of the `/etc/skel` to the user's HOME directory.

> If you want to create a new user with a default files, you need to add them in `/etc/skel` besides the default ones.


Eg.
```
$ useradd -m test
$ ls -al /home/test
```


Param | Desc
------|------
-c comment | For the comment field
-d home_dir | Specifies a different name for the HOME directory
-e exprire_date | Specifies a date [YYYY-MM-DD], when the account will expire
-f inactive_days | Number of days after a password expires when the account will be disabled. 0: disables the account as soon as the password expires. 1: disables this feautre.
-g initial_group | Specifies the GID
-G group . . . | Other groups
-k | Copies the /etc/skel into HOME directory (must use -m)
-m | Creates the user HOME directory if it does not exist
-M | Doesn't create a user's HOME directory
-n | Creates a new group using the user's login name
-r | Creates a system account
-p passwd | Default password for the user account
-s shell | Default login shell
-u uid | Specifies the UID



To change the system default values, we need to use `-D` parameter along these parameters:

Param | Desc
------|------
-b default_home | Location of user's HOME directory. 
-e expiration_data | Expiration date on new accounts. 
-f inactive | Number of days after a password has expired before the account is disabled
-g group | Default group name or GID
-s shell | Default login shell



##### Removing:

To remove a user from the system: `$ userdel`.  
By default this command will only remove the information in the `/etc/passwd`.  
Adding `-r` will remove the HOME directory of that user but other files in other places will be not deleted.

Eg.
```
$ sudo userdel -r test
```

> Check before removing the HOME directory because a program or another user might be using that HOME.


##### Modifying:

* `usermod`: Provides options for changing most of the `/etc/passwd` fields.
    
    * -c: comment
    * -e: expiration date
    * -g: default login group
    * -G: append the user to a group (`$ usermod -G group user`)
    * -l: login name
    * -L: Locks the account so the user can't log in
    * -p: changes the password
    * -u: Unlocks the account

* `passwd`:

Quick way to change the password: `$ passwd [user]`. If the user is omitted, this will change the current user password.

> Only root user can change someone else's password.

> `-e`: force a user to change password on the next log in.

* `chpasswd`:

Change password for lots of users on the system:
```
$ sudo chpasswd < users.txt
```
The file contains list of login name and password pairs (separated by a colon).


* `chsh`:

Changes the default login shell for a user.

> Must specify the whole path of the shell and not only the name.

Eg.
```
$ sudo chsh -s /bin/csh test
```

* `chfn`:

Store information in the comments field in `/etc/passwd`.

This will be used with the `$ finger <user>` program, and because of security concerns this program is not installed by default.

If you use is without commands, it will ask you for the required information.

> All the finger information is neatly stored in `/etc/passwd` file.


* `chage`: 

Helps you manage the password aging process for user accounts.


Param | Desc
------|------
-d | Sets the number of days since the password was last changed
-E | Sets the date the password expires
-I | Sets the number of days of inacttivity after the password expires to lock the account
-m | Sets the minimum number of days between password changes
-W | Sets the number of days before the password expires that a warning message appears


The date can be:
    - YYYY-MM-DD
    - number of days since January 1, 1970


> Expired accounts are similar to locked accounts. The account still exists, but the user can't log in with it.




#### Linux Groups:


Group permissions allow multiple users to share a common set of permissions for an object on the system.  
Each group has a unique GID and unique name.

The group information is stored in `/etc/group`.  
The fields are:

    - name
    - password
    - GID
    - List of user accounts that belong to the group

> Any UID or GID that's bellow 500 is for system.

The password allows a non-group user to temporarily become a member of the group.  
This feature is not used all that commonly.

Never add users by editing the `/etc/group`, you must use the `usermod` command.


> Several groups in the list don't have any users listed and it's not because they don't have any members.
> When a user account uses a group as _default_ group in the `/etc/passwd` file, the user account doesn't appear in the `/etc/group` as a member.


* To add a group: `$ groupadd <group_name>`
* Now to add a user to it: `$ usermod -G <group_name> <user_name>`


> If you change the user groups for an account that is currently logged.
> The user must log out and then log back in for the group changes to take effect.


> Cautious using `-g` and `-G` with `usermod`.


Parameters for `$ groupmod`:

    * `-g`: change the GID
    * `-n <new_name> <old_name>` change the group name


> You can change the name of a group as often as you want because all security permissions are based on the GID.



#### File Permissions:


Types of file:
    * -: regular
    * d: directories
    * l: links
    * c: character devices
    * b: block devices
    * n: network devices


> umask and file permissions.
> 666 for files, 777 for dirs.



#### Ownership:


To change ownership:
```
$ chown options owner[.group] file
```

Eg.

```
$ chown .group file
$ chown user. file
```

Options:
    * -R: recursively through subdirectories and files.
    * -h: changes the ownership of any files that are symbolically linked to the file.



To change group:
```
$ chgrp group file
```


#### Sharing Files:

There are 3 additional bits of information:

    * __SUID__ (set user id): When a file is executed by a user, the program runs under the permissions of the file owner.
    * __SGID__ (set group id): 
        - For a file: The program runs under the permissions of the file group.
        - For a directory: new files created in the directory use the directory group as the default group.
    * __sticky bit__: file remains in memory after the process ends.


The __SGID__ is importatn for sharing files.  It forces all new files created in a shared directory to be owned by the directory's group.

These bits are added to the beginning of the standard 3-digit octal value.

Binar | Octal | Desc
------|-------|------
000 | 0 | All bits are cleared
001 | 1 | sticky bit 
010 | 2 | SGID bit
011 | 3 | SGID + sticky bit
100 | 4 | SUID bit
101 | 5 | SUID + sticky bit
110 | 6 | SUID + SGID bit
111 | 7 | All



#### File Systems:


`# fsck options filesystem`: checks and repairs most Linux filesystem types.  
It uses the `/etc/fstab` file to determine the filesystem on a storage device.

Option | Desc
-------|------
-a | Automatically repairs the filesystem if errors are detected
-A | Checks all the filesystems listed in /etc/fstab
-C | Displays a progress bar for filesystems that support that feature
-N | Doesn't run the check, by list the checks that would be performed
-r | Prompts to fix it errors found
-R | Skips the root filesystem if using the -A
-s | If checking multiple filesystems, performs the checks one at a time
-t | Specifies the filesystem type to check
-T | Doesn't show the header information when starting
-V | Verbose output during the checks
-y | Automatically repairs the filesystem if errors detected


> You can run this command only on unmounted filesystems.
> So for the root filesystem, use a LiveCD.


> Explore more chapter 8.



#### Managing Softwares:


For the Debian-based family, the tools for managing softwares:
    * apt-get
    * apt-cache
    * aptitude
    * dpkg



##### aptitude:

You can use the `$ aptitude` command to open the tool and find all supported programs.

You can run `$ aptitude show package_name` to display details of the package.

You can search for a package: `$ aptitude search package_name`.
The wildcards are automatically implied so you don't need to insert them.


> You can list all files associated with a software package.
> `dpkg -L package_name`

> To do a reverse finding, from a particular file find the concerned package:
> `dpkg --search absolute_file_name`


You can install a package with: `$ aptitude install package_name`


To update softwares: `$ aptitude safe-upgrade`

> The above command should be runned on a regular basis to keep the system up to date.
> It is also important to run it after a fresh distribution installation.

or you can go wild with:
    * `$ aptitude full-upgrade`
    * `$ aptitude dist-upgrade`



To remove package: `$ aptitude purge package_name`.



> After installation or a remove of a package you can check with `$ aptitude search`.


The default software repository locations for `aptitude` are set up for you when you install your Linux distribution.  
The repository locations are stored in the file `/etc/apt/sources.list`.

> `aptitude` only pulls software from these repositories.

If you need to include some additional software repositories for your PMS, this is the place to do it.


The `/etc/apt/source.list` contains these lines:
```
deb (or deb-src) address distribution_name package_type_list
```

* `deb:`: source of compiled programs
* `deb-src`: source of source code
* `address`: software repository's web address
* `distribution_name`: name of this particular software repository's distribution's version.
* `package_type_list`: may be more than one word and indicates what types of packages the repository has in it.


#### Vim: 


> To find the final file of a link we can use `$ readlink -f path_to_link`/

eg.
```
$ readlink -f /usr/bin/vi
```

This should output:
```
/usr/bin/vim.basic
```




