# HACS: Home Assistant Community Store (snap)

HACS gives you a powerful UI to handle downloads of all your custom needs.

See [https://hacs.xyz/](https://hacs.xyz/) after installation.

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/home-assistant-hacs)
[![Donate with PayPal](https://giaever.online/paypal-donate-button.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=69NA8SXXFBDBN&source=https://git.giaever.org/joachimmg/home-assistant-hacs)

## Build and installation
### Install from The Snap Store (Recommended)

Make sure you have Snapd installed on your system. See [Installing snapd](https://snapcraft.io/docs/installing-snapd) for a list of distributions with and without snap pre-installed, including installation instructions for those that have not.

```bash
$ snap install home-assistant-hacs
```

The snap `home-assistant-snap` is required and will automatically install if it isn't already, when installing `home-assistant-hacs`.

#### Connect with Home Assistant

Make sure that the connection is established (should be automatical), by executing

```
snap connections
```

If the connection is not in the returned list, execute

```
snap connect home-assistant-hacs:components home-assistant-snap:components
```
to make the connection. Now

1. Go into Home Assitants **web-UI** > `configuration` > `integrations` and press the `+ sign`. 

2. Search for HACS and select it from the list. 
3. Continue with the configurations as described in the [official documentation](https://hacs.xyz/docs/configuration/start). 
4. When the configuration is made and HACS is installed successfully, restart home-assistant-snap `snap restart home-assistant-snap`.

### Build this snap from source

We recommend that your download a pre-built version of this snap from [The Snap Store](https://snapcraft.io/home-assistant-hacs), or at least make sure that you checkout the latest tag, as the master tag might contain faulty code during development.

1. **Clone this repo and checkout the latest tag**

```bash
$ git clone https://git.giaever.org/joachimmg/home-assistant-hacs.git

# Go into directory
$ cd ./home-assistant-hacs

# Checkout tag
$ git checkout <tag>
```
_**NOTE**: You can find the latest tag with `git ls-remote --tags origin`_

2. **Build and install**

Make sure you have snapd (see [Installing snapd](https://snapcraft.io/docs/installing-snapd)) and latest version of Snapcraft. Install Snapcraft with

```bash
$ sudo snap install snapcraft --classic
```

Or update with

```bash
$ sudo snap refresh snapcraft
```

2.2 **With multipass**

From the «home-assistant-hacs»-directory, run

```bash
$ snapcraft
```

Multipass will be installed and a virtual machine will boot up and build your snap. The final snap will be located in the same directory.

2.3 **With LXD** (*required* for Raspberry Pie)

Snapcraft will try to install multiplass and build the snap for you, but on *Raspberry Pi* it will fail. You will have to use an LXD container.

Install LXD and create a container

```bash
$ snap install lxd
$ snap lxd init
```

Make sure your user is a member of lxd-group

```bash
$ sudo adduser $USER lxd
```

Launch an Ubuntu 20.04 container instance

```bash
$ lxc launch ubuntu:20.04 home-assistant-hacs
```

Make sure you're in the «home-assistant-hacs»-directory and go into the shell of your newly created container

```bash
$ lxc exec -- home-assistant-hacs /bin/bash
```

and run

```bash
$ SNAPCRAFT_BUILD_ENVIRONMENT=host snapcraft
```

when the build is complete, you'll have to exit the shell and pull the snap-file from the container. See `lxc file pull --help`.

3. **Install new built snap**

```
$ sudo snap install ./home-assistant-hacs_<source-tag>.snap --dangerous
```

Now, [connect HACS to Home Assistant](#connect-with-home-assistant).
