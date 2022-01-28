# GS-telemetry (a Virtual Machine OVA)

### This system/toolbox was built to support the SPOC cubesat team, but it can also be used by others to get familiar with software that is used by satellite reception enthusiasts.

This system is a Debian Buster/amd64 based Virtual Machine with the following software installed, to run as a satellite telemetry reception ground station.

The Virtual machine is created on Virtualbox 6.1 and exported as an `Open Virtualization Format 1.0` the virtual disk is in vmdk format so VMware users should also be able to import the ova and run the Virtual Machine in there environment (this is not tested, please share your experience). The VM also expects that the VirtualBox Extension Pack is installed, this is providing support for USB 2.0 and higher.

The details of the installation including user account information can be found in the Virtual machines General Description after the ova import.

When importing this OVA on a Virtualbox host there will be a network port NAT enabled so one can login to the ssh server that is active on the virtual machine. The port NAT redirects port 2222 on the host system to port 22 on the virtual machine. Here an example to connect to the VM `ssh -l lab -p 2222 <VirtualBox host ip>`, for other operating systems you maybe need to use another ssh client such as [PuTTY](https://www.putty.org/).


- SatNOGS ground station: Installed with the help of this Wiki: [https://wiki.satnogs.org/SatNOGS_Client_Ansible](https://wiki.satnogs.org/SatNOGS_Client_Ansible)
- GNURadio 3.8.2: This is part of the satnogs repository that is enabled by the `ansible install`
- GR-Satellites: Installed with the help of the following documentation: [https://gr-satellites.readthedocs.io/](https://gr-satellites.readthedocs.io/)
- strf: Installed with the information on [https://github.com/cbassa/strf](https://github.com/cbassa/strf)
- sattools: Installed with the information on [https://github.com/cbassa/sattools](https://github.com/cbassa/sattools)
- GQRX: Installed as a debian package `ii  gqrx-sdr 2.11.5-1+b2 amd64 Software defined radio receiver`
- SoundModem: It is possible with the help if wine32 to run the soundmodem software from UZ7HO [http://uz7.ho.ua/packetradio.htm](http://uz7.ho.ua/packetradio.htm)
- GetKISS+: It is possible with the help if wine32 to run the GetKISS+ software from DK3WN [https://www.satblog.info/software/](https://www.satblog.info/software/)

<img src="images/gs-telemetry-information.jpg" alt="GS-Telemetry Software">

### Some basics on how to work with the VM

This VM comes with no graphical user interface (gui) for the application that do need one, like gnuradio-companion, you need to use another system as gui.\
A gui can be used on multiple operating system, like Windows, Linux, BSD, macOS, so what do you need for this:

- If you have a Linux based system with a gui present, the only thing you have to do is login to the VM with an ssh connecting and add the option `-X` after the connection is active you can run every gui based program and it will show its output on the system were you started the ssh connection.
- For a Windows operating system you need to install a so called X-server, I use [X410](https://x410.dev/) but you also use [VcXsrv](https://sourceforge.net/projects/vcxsrv/). When this is installed and active try the below example to see if everything is working.
- When running macOS you need to install [XQuartz](https://www.xquartz.org/).


Here an example where the connection is made and the gui application xeyes is executed, just a simple program to test the X connection.

<img src="images/gs-telemetry-xsession.jpg" alt="GS-Telemetry X session">

## Q&A

### How to run the applications:

Login as the main user, by default this is the user `lab`.

CLI programs:\
- satnogs setup: `sudo satnogs-setup`
- gr-satellites: `gr_satellites --version`

GUI programs (these will need a active gui configuration):

- GNURadio: `gnuradio-companion`
- STRF and SATTOOLS: `rfplot -h, skymap -h` etc
- GQRX: `gqrx`

- AFSK soundmodem: `sm_afsk`
- HighSpeed soundmodem: `sm_hs`
- BOBCAT1 soundmodem: `sm_bobcat`
- GetKISS: `getkiss`
- Windows explorer: `explorer`
- GNOME terminal: `terminal`


All changes can be found in [CHANGELOG.md](CHANGELOG.md)
