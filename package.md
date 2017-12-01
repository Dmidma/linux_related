Package Management: method of installing and maintaining software on the system.

Package File: compressed collection of files that comprise the software package.
    It may include:
	-numerous programs
	-data files
	-metadata
	-pre/post-installation scripts

    => Package Maintainer

Repositories: contain many thousand of packages, each specially built and maintained for 
distribution.

Dependencies: if a package requires a "shared library", it is said to have a "dependency".




Tools:
    Low-Level: dpkg
    High-Level: apt-get (dependency resolution).





#### Finding a P. in a Repository: 
```
apt-get update, apt-cache search search_string
```

### Installing a P. from a Repository: 
```
apt-get update, apt-get install package_name
```

#### Cleaning Cache:
```
apt-get clean
```
Clears the local repository of retrieved package files (.deb files).
It removes everything but the lock file from:
    * /var/cache/apt/archives/
    * /var/cache/apt/archives/partial/

> We can have `apt-get autoclean` and `apt-get autoremove`

This will only removes package files that can no longer be downloaded, and largely useless.

#### Installing a P. from a Package File: 
	dpkg --install package_file
    
    (No dependency resolution, exit with error)

Removing a P.: 
	apt-get remove package_name

Updating P.s from a Repository: 
	apt-get update, apt-get upgrade

Updating P.s from a Package File: 
	dpkg --install package_file

Listing Installed P.s: 
	dpkg --list

Determining if a P. is Installed: 
	dpkg --status package_name

Displaying Info about Installed P.: 
	apt-cache show package_name

Finding Which Package Intalled a File: 
	dpkg --search file_name




> A good idea is to back up config files like `/etc/apt/source.lis`, so you can revert the changes if needed.


* If we have an error like:
```
<some-package>: Depends: <other-package> (= version) but this-version is to be installed
```
Open terminal and type: `software-properties-gtk`, under **Ubuntu Software** tab, enable all the repositories.



* One of the most basic fixes to resolve dependencies problems:
```
$ sudo apt-get -f install
```
The -f stands for "fix broken".  
apt-get will either attempt to correct broken dependencies, or install dependencies or simply remove the package that you installed to resolve the problem.

Then run:
```
$ sudo dpkg --configure -a
$ sudo apt-get -f install
```

If the output is:
```
0 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
```

```
$ sudo apt-get -u dist-upgrade
```
If it shows any held packages, it is best to eliminate them.  
This is becaue of dependency conflicts that apt cannot resolve.

This command:
```
$ sudo apt-get -o Debug::pkgProblemResolver=yes dist-upgrade
```
Will try to find and repaire the conflicts; if it cannot fix it, it will exit with:

```
0 upgraded, 0 newly installed, 0 to remove and 6 not upgraded.
```

> Delete the held packages one by one, running `dist-upgrade` each time, until there are no more held packages.
> Be sure to use `--dry-run` to be fully informed of consequences:
```
$sudo apt-get remove --dry-run <package-name>
```


#### Disable/Remove/Purge PPAs:

Most common causes of unmet dependencies are PPAs.  
To solve the problem you have three options:
    * disable
    * purge
    * remove


* Disable:
From a terminal, type: `software-properties-gtk`, and go to **Other Software** tab.  
Find the ppa you want to disable and uncheck its boxes.


* Purge:
Purging means downgrading the packages in the selected PPA to the version in the official Ubuntu repo and disabling that PPA.
```
$ sudo apt-get install ppa-purge
```
or
```
mkdir ppa-purge && cd ppa-purge && wget http://mirror.pnl.gov/ubuntu/pool/universe/p/ppa-purge/ppa-purge_0.2.8+bzr56_all.deb && wget http://mirror.pnl.gov/ubuntu//pool/main/a/aptitude/aptitude_0.6.6-1ubuntu1_i386.deb && sudo dpkg -i ./*.deb
```

> To remove a PPA it must be first activated.

* Remove:
Using purge with unsupported PPA from official Ubutntu repo, will not neither downgrade or delete.  
To delete.

```
$ sudo apt-get autoremove --purge package-name
$ sudo add-apt-repository --remove ppa:someppa/ppa
$ sudo apt-get autoclean
```

> Ignore the first command if you don't want to remove the installed packages.


To list the available PPAs:
```
$ cat /etc/apt/sources.list.d/*
```

> You can install Y PPA Manager to help you with PPAs.




