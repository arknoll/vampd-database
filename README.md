[![Stories in Ready](https://badge.waffle.io/arknoll/nmddatabase.png?label=ready&title=Ready)](https://waffle.io/arknoll/nmddatabase)
[![Build Status](https://travis-ci.org/arknoll/nmddatabase.svg?branch=master)](https://travis-ci.org/arknoll/nmddatabase) [![Coverage Status](https://coveralls.io/repos/arknoll/nmddatabase/badge.png?branch=master)](https://coveralls.io/r/arknoll/nmddatabase?branch=master) [![Dependency Status](https://gemnasium.com/arknoll/nmddatabase.svg)](https://gemnasium.com/arknoll/nmddatabase)

newmedia Denver's mysql Cookbook
================================

nmddatabase (0.0.1) Manages mysql users


Requirements
------------

### Platforms

`ubuntu = 12.04`

### Dependencies

`chef-client >= 0.0.0`

`apt >= 0.0.0`


Attributes
----------

### nmddatabase::default
    # No attributes.

### nmddatabase::user_access


Recipes
-------

### nmddatabase::default


Testing and Utility
-------

    rake foodcritic                       # Lint Chef cookbooks
    rake integration                      # Alias for kitchen:all
    rake kitchen:all                      # Run all test instances
    rake kitchen:default-ubuntu-1204      # Run default-ubuntu-1204 test instance
    rake kitchen:ldap-ubuntu-1204         # Run ldap-ubuntu-1204 test instance
    rake kitchen:yubico-ldap-ubuntu-1204  # Run yubico-ldap-ubuntu-1204 test instance
    rake kitchen:yubico-ubuntu-1204       # Run yubico-ubuntu-1204 test instance
    rake readme                           # Generate the Readme.md file
    rake rubocop                          # Run RuboCop style and lint checks
    rake spec                             # Run ChefSpec examples
    rake test                             # Run all tests


License and Author
------------------

Author:: Kevin Bridges

Copyright:: 2014, NewMedia Denver

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Contributing
------------

We welcome contributed improvements and bug fixes via the usual workflow:

1. Fork this repository
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new pull request
