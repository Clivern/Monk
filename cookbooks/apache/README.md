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

// OR

{
   "run_list": [
      "recipe[apache::install]"
   ]
}

// OR

{
   "run_list": [
      "recipe[apache::purge]"
   ]
}

// OR

{
   "run_list": [
      "recipe[apache::remove]"
   ]
}
```


Acknowledgements
----------------

© 2018, Clivern. Released under [The Apache Software License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).

**Apache Cookbook** is authored and maintained by [@clivern](http://github.com/clivern).