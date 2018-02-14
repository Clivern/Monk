## Chef Server

### Install the Chef Server on Ubuntu 16.04 x64

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

