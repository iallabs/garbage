# garbage

A scripts/docs/files garbage collection command line

# Usage
dependencies : git

```shell
git clone $$$$
```

Configure garbage directory ( garbage.sh will use $HOME/garbage by default if you dont set a dir )
```
./garbage.sh --config [-d --gdirectory]
```

Start using garbage

```shell
source garbage.sh
```

# GitHub configuration
to get simple upload to github repository:
- fork this project
- add config.json



# Examples

- Set garbage directory

```
garbage --make
```

- send to garbage directory

```
garbage --move [-d directory | -f file | * | target_files/dirs ]
garbage --copy [-d directory | -f file | * | target_files/dirs ]
```

- remove from garbage directory

```
garbage --remove [ -n name | -m module | * ]
```

- clear garbage directory

```
garbage --clear
```

- upload to github
