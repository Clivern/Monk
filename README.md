Monk
====

Easy To Use Chef Recipes To Automate Boring Stuff.


Setup
-----

### Install the Chef Server Ubuntu 16.04 x64

1. Ensure that the Server is Accessible by Hostname
The first task you need to perform is to ensure that the hostname of the server is a resolvable fully qualified domain name (FQDN) or IP address. You can check this by typing:

```bash
hostname -f
```

It should be something like the following:

```bash
sudo nano /etc/hosts
```

```bash
127.0.1.1 fqdn_or_IP_address host_alias
127.0.0.1 localhost
IP_address fqdn_or_IP_address host_alias
```

2. Ensure that Server are up-to-date:
```bash
sudo apt-get update
```

3. Download the latest Chef server core (12.17.15 at the time of writing):
```bash
wget https://packages.chef.io/files/stable/chef-server/12.17.15/ubuntu/16.04/chef-server-core_12.17.15-1_amd64.deb
```

4. Install the server:
```bash
sudo dpkg -i chef-server-core_*.deb
```

5. Remove the download file:
```bash
rm chef-server-core_*.deb
```

6. Run the chef-server-ctl command to start the Chef server services:
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
sudo chef-server-ctl user-create monk john doe hello@monk.com password -f monk.pem
```

2. You can create an organization with the org-create sub-command.
```bash
chef-server-ctl org-create SHORTNAME LONGNAME --association_user USERNAME
```

For example, let's go with the following:
```bash
sudo chef-server-ctl org-create clivern "Clivern.com" --association_user monk -f clivern-validator.pem
```

### Install Management Server

In order to install the management server, Just run the following:

```bash
chef-server-ctl install chef-manage
chef-server-ctl reconfigure
chef-manage-ctl reconfigure
```

### Configure a Chef Workstation

1. Clone this repository.

```bash
git clone https://github.com/Clivern/Monk.git Monk
```

2. [Download and Install the Chef Development Kit](https://downloads.chef.io/chefdk#/).

3. Create `.chef` directory inside `Monk` repository.
```bash
cd Monk
mkdir .chef
```

4. Then transfer the previously created private keys on chef server to `.chef` directory.
```bash
cd Monk
scp root@chef_server_domain_or_ip:/root/monk.pem ./.chef
scp root@chef_server_domain_or_ip:/root/clivern-validator.pem ./.chef
```

### Configuring Knife to Manage your Chef Environment

Now that you have your Chef keys available on your workstation, we can configure the knife to connect to and control your Chef infrastructure. This is done through a knife.rb file that we will place inside `.chef` directory along with our keys.
```bash
nano ./.chef/knife.rb
```

In this file, paste the following information:
```ruby
current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "username"
client_key               "#{current_dir}/name_of_user_key"
validation_client_name   "organization_name-validator"
validation_key           "#{current_dir}/organization_key"
chef_server_url          "https://server_domain_or_IP/organizations/organization_name"
syntax_check_cache_path  "#{ENV['HOME']}/.chef/syntaxcache"
cookbook_path            ["#{current_dir}/../cookbooks"]
```

Which on our case should be something like the following:
```ruby
current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "monk"
client_key               "#{current_dir}/monk.pem"
validation_client_name   "clivern-validator"
validation_key           "#{current_dir}/clivern-validator.pem"
chef_server_url          "https://server_domain_or_IP/organizations/clivern"
syntax_check_cache_path  "#{ENV['HOME']}/.chef/syntaxcache"
cookbook_path            ["#{current_dir}/../cookbooks"]
```

Now if we run `knife client list`, we should get `clivern-validator`.


### Bootstrapping a New Node with Knife

In order to bootstrap a new node, you can use the following command:
```bash
knife bootstrap node_domain_or_IP [options]
```

In case we want to bootstrap a node with name `node-01` and username is `root` and the private key is in `.chef` directory, we should run the following on our chef workstation.
```bash
knife bootstrap node_domain_or_IP -x root -A -N node-01
```

Once your new node is bootstrapped, you should have a new client and a new node:
```bash
$ knife client list

    clivern-validator
    node-01


$ knife node list

    node-01
```


Our Cookbooks
-------------

- [Package Cookbook](https://github.com/Clivern/Monk/tree/master/cookbooks/package): Install and Configure Linux Packages.
- [Apache Cookbook](https://github.com/Clivern/Monk/tree/master/cookbooks/apache): Install and Configure Apache Server.
- [Nginx Cookbook](https://github.com/Clivern/Monk/tree/master/cookbooks/nginx): Install and Configure Nginx Server.
- [Django Apps Cookbook](https://github.com/Clivern/Kevin-Cookbook/): Install and Configure Django/Python Apps.
- [Consul Cookbook](https://github.com/Clivern/Consul-Cookbook/): Install and Configure [Consul](https://www.consul.io/).
- [HAProxy Cookbook](https://github.com/Clivern/HAProxy-Cookbook/): Install and Configure [HAProxy](http://www.haproxy.org/).
- [MySQL Replication Cookbook](https://github.com/Clivern/MySQL-Replication-Cookbook/): Replicate MySQL With Chef.
- [Prometheus Cookbook](https://github.com/Clivern/Prometheus-Cookbook): Install and Configure [Prometheus](https://www.prometheus.io/).


Community Cookbooks
-------------------

- [Users](https://github.com/chef-cookbooks/users): Manages OS users from databags.


Acknowledgements
----------------

© 2018, Clivern. Released under [The Apache Software License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).

**Monk** is authored and maintained by [@clivern](http://github.com/clivern).
