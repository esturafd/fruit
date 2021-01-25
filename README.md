# Fruit

Script for ssh connections by password using bitwarden. the official recommendation is to use ssh key, but 
this script considers cases where this is not possible, why it is prohibited or it is not considered necessary.

## Dependencies
* openssh-client (ssh)
* sshpass

### Password manager
This script does not manage passwords, but uses an external password manager, which supports:

* [bitwarden-cli](https://bitwarden.com/help/article/cli/#download-and-install)
* [pass](https://www.passwordstore.org/)

## Install
```bash
git clone https://github.com/esturafd/fruit.git .fruit
chmod 765 .fruit/fruit.sh
cd /usr/bin; sudo ln -s ~/.fruit/fruit.sh fruit
```

## Use
```bash
# fruit [fruit-options] TARGET [ssh-options]
#
# Options:
#    -p    specific executor like ssh, sftp, etc
#    -f    sftp executor
#    -h    this help

# common use without options
fruit test.com

# use with ssh options
fruit something.com -L 80:otherhost:8080

# use with fruit options
fruit -f ohterhost.com
```

It's recommended to add the host configuration to the ssh configfile, configurations such hostname, user or others, 
and with hostid add a new item in bitwarden with name of `ssh:<hostid>`.

### ssh configfile
```
Host example
    HostName 192.168.1.34
    User someuser

# fruit example
```

### Configuration vars
This script uses these configuration variables:

#### FRUIT_CONFIG
It refers to the ssh configuration file that will be used by default, if it is empty, the one with ssh by default will be used

#### FRUIT_PASSMANAGER
This variable indicates the password manager that will be used to obtain the passwords, its value can be `bitwarden` or `pass`.

#### FRUIT_ACCOUNT
This variable refers to the user of the password manager account (bitwarden) or of the folder hierarchy where the passwords to be obtained are found (pass).
