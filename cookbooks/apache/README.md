Apache Cookbook
===============

Installs and Configures Apache.

Usage
-----

Add one of the available recipes to your node run list:

```bash
$ knife node edit node-01
```

```json
{
   "run_list": [
      "recipe[apache::default]"
   ]
}
```


Acknowledgements
----------------

© 2018, Clivern. Released under [The Apache Software License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).

**Package Cookbook** is authored and maintained by [@clivern](http://github.com/clivern).