# Fruit

Script for ssh connections by password. the official recommendation is to use ssh key, but this script considers 
cases where this is not possible, why it is prohibited or it is not considered necessary.

## Install
```bash
git clone https://github.com/esturafd/fruit.git .fruit
cd /usr/bin; ln -s ~/.fruit/fruit.sh fruit
```

## Use
```
fruit [host] [options]

example:
fruit test.com
fruit something.com -L 80:otherhost:8080
```
