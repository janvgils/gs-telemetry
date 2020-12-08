# gs-telemetry

Date: 05-12-2020 Version 1.0 (Initial release)\
Date: 06-12-2020 Version 1.1


Debian Buster/amd64 based Virtual Machine with the following software installed satellite groundstation software.

The Virtual machine is created on Virtualbox 6.1 and exported as an `Open Virtualization Format 1.0` the virtual disk is in vmdk format so VMware users should also be able to import the ova and run the Virtual Machine in there enviroment (this is not tested, please share your experience).

The details of the installation can be found in the General Description after the ova import.


- SatNOGS groundstation: Installed with the help of this Wiki: `https://wiki.satnogs.org/SatNOGS_Client_Ansible`
- GNURadio 3.8.2: This is part of the satnogs repository that is enabled by the `ansible install`
- GR-Satellites: Installed with the help of the following documentation: `https://gr-satellites.readthedocs.io/`
- strf: Installed with the information on `https://github.com/cbassa/strf`
- sattools: Installed with the information on `https://github.com/cbassa/sattools`
- GQRX: Installed as a debian package `ii  gqrx-sdr 2.11.5-1+b2 amd64 Software defined radio receiver`
- SoundModem: It is possible with the help if wine32 to run the soundmodem software from UZ7HO `http://uz7.ho.ua/packetradio.htm`
- GetKISS+: It is possible with the help if wine32 to run the GetKISS+ software from DK3WN `https://www.satblog.info/software/`

