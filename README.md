A very simple script to test `docker-compose up` for the [ampache project]
in various distros running in VMs.

This is all simplified thanks to [Vagrant].

# Running

Run `./ampache.sh`.
It will print out OSes that `docker-compose up` has been tested on
 and that you can test.

Currently those are:

 - `arch`: Arch Linux
 - `opensuse`: Opensuse 15 (Leap)
 - `ubuntu`: Ubuntu 20.04 (Focal)

Once you've chosen one, run `./ampache.sh <OS arg>` e.g `./ampache.sh ubuntu`.

## When can I open the webbrowser?

When you see `NOTICE: ready to handle connections` in the logs, open http://localhost:8080 .
You should hopefully be greeted by an ampache login prompt.

Email: ampache@test.test  
Password: ampache

Should get you in
## Switching OSes

If you have a VM running and want to switch, just run `./ampache.sh <OS arg>` 
 and the running machine will be destroyed to then be replaced with the chosen OS.

# Adding more

1. `vagrant destroy -f`
1. `cp arch.Vagrantfile Vagrantfile`
1. Modify `config.vm.box = "..."` to use a box from the [vagrant box registry]
1. Adapt `config.vm.provision "shell", inline: <<-SHELL` to install the requirements
1. Run `./ampache.sh` (no args) to verify the setup
   It's recommended to `vagrant ssh` into the box and get things to work then adapt the provisioning.
1. Make a copy of the Vagrantfile with a prefix of your OS `cp Vagrantfile $os.Vagrantfile`
1. Add your OS prefix to `ampache.sh`

Done.

[ampache project]: https://github.com/ampache/ampache/
[Vagrant]: https://vagrantup.com
[vagrant box registry]: https://app.vagrantup.com/boxes/search

