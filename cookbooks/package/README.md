Package Cookbook
================

Installs and Configures Linux Packages.

Usage
-----

Add one of the available recipes to your node run list:

```json
{
	//Other Stuff Here...

  	"run_list": [
 	 	"recipe[package::default]"
	]

	//Other Stuff Here...
}
// OR
{
	//Other Stuff Here...

  	"run_list": [
 	 	"recipe[package::install]"
	]

	//Other Stuff Here...
}
// OR
{
	//Other Stuff Here...

  	"run_list": [
 	 	"recipe[package::update]"
	]

	//Other Stuff Here...
}
```

The Available parametes for the `recipe[package::install]` are the following:

```ruby
default['package']['install'] = []
```

And you are free to change it on the `attributes/default.rb` or from the details of a node on a Chef server:

```json
{
  	"name": "node-01",

  	//Other Attributes Here...

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

  	//Other Attributes Here...

  	"run_list": [
  		"recipe[package::default]"
	]
}
```


Acknowledgements
----------------

© 2018, Clivern. Released under [The Apache Software License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).

**Package Cookbook** is authored and maintained by [@clivern](http://github.com/clivern).