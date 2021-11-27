# Update the system

If you downloaded and imported the ova file it is absolutely possible that there are updates available for the tools installed. So how to go forward when you want to update.

### OS updates:

There are a couple of shell aliases that can be used:

```
alias os-clean='sudo apt-get clean'
alias os-purge='sudo apt-get --purge autoremove'
alias os-update='sudo apt-get update && sudo apt-get upgrade'
```
So lets start after you have logged in as the lab user with the `os-update` command, this will request your password because the alias is using `sudo`. This command will update the package information and propose the update packages, and will show you the following output.

```
Calculating upgrade... Done
The following packages have been kept back:
  linux-headers-amd64 linux-image-amd64
The following packages will be upgraded:
  ansible base-files bind9-host debconf debconf-i18n distro-info-data
  krb5-locales libavcodec58 libavcodec58:i386 libavfilter7 libavformat58
  libavresample4 libavresample4:i386 libavutil56 libavutil56:i386 libbind9-161
  libdns-export1104 libdns1104 libgssapi-krb5-2 libgssapi-krb5-2:i386
  libisc-export1100 libisc1100 libisccc161 libisccfg163
  libjavascriptcoregtk-4.0-18 libk5crypto3 libk5crypto3:i386 libkrb5-3
  libkrb5-3:i386 libkrb5support0 libkrb5support0:i386 liblwres161 libmariadb3
  libpostproc55 libpq5 libswresample3 libswresample3:i386 libswscale5 libtiff5
  libtiff5:i386 libwebkit2gtk-4.0-37 linux-compiler-gcc-8-x86
  linux-kbuild-4.19 linux-libc-dev mariadb-common python3-debconf tzdata
47 upgraded, 0 newly installed, 0 to remove and 2 not upgraded.
Need to get 49.3 MB of archives.
After this operation, 1,918 kB of additional disk space will be used.
Do you want to continue? [Y/n]
```

Just hit `Y` and the update will start, as you can see there are also some packages with the state `kept back` after the first run we will update them manualy.

So now the first run is done we will manually do the `kept back` packages.

In this example the command is `sudo apt-get install linux-headers-amd64 linux-image-amd64`

```
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  linux-headers-4.19.0-18-amd64 linux-headers-4.19.0-18-common
  linux-image-4.19.0-18-amd64
Suggested packages:
  linux-doc-4.19 debian-kernel-handbook
The following NEW packages will be installed:
  linux-headers-4.19.0-18-amd64 linux-headers-4.19.0-18-common
  linux-image-4.19.0-18-amd64
The following packages will be upgraded:
  linux-headers-amd64 linux-image-amd64
2 upgraded, 3 newly installed, 0 to remove and 0 not upgraded.
Need to get 58.0 MB of archives.
After this operation, 326 MB of additional disk space will be used.
Do you want to continue? [Y/n] 
```

And again press 'Y'

When that is also done we execute the following commands

`os-purge` that will remove packages that are no longer needed.
`os-clean` that will clean up the local package cache.

That all for the OS update.

### SatNOGS update

You are still logged in as the user lab and now you execute `sudo satnogs-setup`

![image](https://user-images.githubusercontent.com/21240133/143591559-cab777bf-ddb3-4fe2-9e9c-979f2563ef92.png)

Choose Update from the menu and hit enter, when it is done select Apply and hit enter.
It is possible you get a warning because this SatNOGS client configuration has no basic settings, this should when you want to use the global satnogs network.
Information on what you need to do can be found at [https://wiki.satnogs.org/SatNOGS_Client_Setup#Initial_Setup](https://wiki.satnogs.org/SatNOGS_Client_Setup#Initial_Setup)

When the update and apply where successful the SatNOGS update was also done.

### Update gr-satellites

Not everyone will use the [gr-satellites](https://gr-satellites.readthedocs.io/en/latest/) solutions but if you do, you can execute the following commands:

You are still logged in as the lab user.

```
cd ${HOME}/source/git/gr-satellites
git pull
cd build
cmake -Wno-dev ../ && make -j2 && sudo make install && sudo ldconfig && gr_satellites --version
```

This will start the build and installation and will end with the output of the gr_satellites version information (swig errors can be ignored).

```
gr_satellites v3.12.0-git
Copyright (C) 2020 Daniel Estevez
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

When this is successful and you are still in the build directory (make sure, dangerous!) you can remove the left overs `rm -rf *` 

### That is all for now.




