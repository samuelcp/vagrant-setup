# Vagrant Setup

*This setup will run on Ubuntu 14.04 LTS (Trusty)*

Help you install and configure Vagrant ready to start develop. 

This stack is widely used as base for older as well as modern projects

- Web Server
    - [*NGINX*](https://www.nginx.com/) - Web and Proxy Server

- Server Side Platform
    - [*HHVM*](http://hhvm.com/) - Virtual Machine for PHP Compiler
    - [*PHP-FPM*](http://hhvm.com/) - FastCGI Process Manager
    - [*NodeJS*](https://nodejs.org/) - Javascript Server Side Platform

- Databases
    - [*MariaDB*](https://mariadb.org/) - Main Database Storage
    - [*Redis*](http://redis.io/) - Persistent Data Storage

- Tools
    - [*Git*](https://git-scm.com/) - Source Code Manager (internal)

## Vagrant Up!
First, copy file `Vagrantfile-sample` to outside of this folder and rename it to `Vagrantfile`. If you are in **Windows** machine, copy file `Vagrantfile-sample-windows` instead of the last one.

Then, open **Terminal** (or **Command Prompt**) and run `vagrant up` to download and install OS. This should take less than half hour (depends on your internet connection). Make sure no error occured and just type `vagrant ssh` (Linux or OS X/macOS) or with PuTTY (via 127.0.0.1:2222) to access the VM.

## Installing Software

Assuming you have installed Vagrant, VirtualBox and OS - Ubuntu (using `vagrant up`), go to path where this repository located inside VM and execute file `install.sh`.

```bash
$ ./install.sh
```
During the installation, you will be asked to enter a password for database credential (MariaDB).

## Run Configuration Script

Execute file `config.sh` inside this repository.
```bash
$ ./config.sh
```

## Important to note

### Folder Name
Make sure the mounted folder inside VM (guest) is named "**vagrant**". By default, this has been set if you use `VagrantFile` from this repository.

### NFS and Access Permissions
By default, NFS has been installed in OS X/macOS machine (unfortunately Windows user can't use this feature). But you need to change permission of shared folder. Run following command inside VM as root.
```bash
chmod 755 -R /vagrant
```

### NPM Dependencies
If you are working on NodeJS or React project, you have to install dependencies with **NPM**. Just go to project path and run `npm install`.
