# Fruit

Script for ssh connections by password using bitwarden. the official recommendation is to use ssh key, but 
this script considers cases where this is not possible, why it is prohibited or it is not considered necessary.

## Install
```bash
git clone https://github.com/esturafd/fruit.git .fruit
chmod 765 .fruit/fruit.sh
cd /usr/bin; sudo ln -s ~/.fruit/fruit.sh fruit
```

## Use
```bash
# fruit [host] [options]
# example:
fruit test.com
fruit something.com -L 80:otherhost:8080
```

It's recommended to add the host configuration to the ssh configfile, configurations such hostname, user or others, 
and with hostid add a new item in bitwarden with name of `ssh:<hostid>`.

#### ssh configfile
```
Host example
    HostName 192.168.1.34
    User someuser

# fruit example
```