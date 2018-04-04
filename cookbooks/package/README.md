Package Cookbook
================

Installs and Configures Linux Packages.

Usage
-----

Add one of the available recipes to your node run list:

```bash
$ knife node edit node-01
```

```json
{
  	"run_list": [
 	 	"recipe[package::default]"
	]
}

// OR

{
  	"run_list": [
 	 	"recipe[package::install]"
	]
}

// OR

{
  	"run_list": [
 	 	"recipe[package::update]"
	]
}
```

The Available parametes for the `recipe[package::install]` are the following:

```ruby
default['package']['install'] = []
```

And you are free to change it on the `attributes/default.rb` or from the details of a node on a Chef server:

```bash
$ knife node edit node-01
```

```json
{
  	"name": "node-01",

  	"normal": {
    	"package": {
      		"install": [
        		"git",
        		"zip",
       	 		"unzip"
      		]
    	},
    	"tags": [

    	]
  	},

  	"run_list": [
  		"recipe[package::default]"
	]
}
```


Acknowledgements
----------------

© 2018, Clivern. Released under [The Apache Software License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).

**Package Cookbook** is authored and maintained by [@clivern](http://github.com/clivern).