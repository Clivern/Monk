Monk
====

Easy To Use Chef Recipes To Automate Boring Stuff.


Setup
-----

### Install the Chef Server Ubuntu 16.04 x64

1. Ensure that Server are up-to-date:
```bash
sudo apt-get update
```

2. Download the latest Chef server core (12.17.15 at the time of writing):
```bash
wget https://packages.chef.io/files/stable/chef-server/12.17.15/ubuntu/16.04/chef-server-core_12.17.15-1_amd64.deb
```

3. Install the server:
```bash
sudo dpkg -i chef-server-core_*.deb
```

4. Remove the download file:
```bash
rm chef-server-core_*.deb
```

5. Run the chef-server-ctl command to start the Chef server services:
```bash
sudo chef-server-ctl reconfigure
```

### Create an Admin User and Organization

1. We can use the user-create sub-command of the chef-server-ctl command. The command requires a number of fields to be passed and The general syntax is:

```bash
chef-server-ctl user-create USERNAME FIRST_NAME LAST_NAME EMAIL PASSWORD
```

For example, Let's go with the following:
```bash
sudo chef-server-ctl user-create monk john doe hello@monk.com pass -f monk.pem
```

2. You can create an organization with the org-create sub-command.
```bash
chef-server-ctl org-create SHORTNAME LONGNAME --association_user USERNAME
```

For example, let's go with the following:
```bash
sudo chef-server-ctl org-create clivern "Clivern.com" --association_user monk -f clivern.pem
```

Our Recipes
-----------



Acknowledgements
----------------

© 2018, Clivern. Released under the [MIT License](http://www.opensource.org/licenses/mit-license.php).

**Monk** is authored and maintained by [@clivern](http://github.com/clivern).