# encoding: utf-8
name 'nmddatabase'
maintainer 'newmedia Denver'
maintainer_email 'support@newmediadenver.com'
license 'Apache 2.0'

version '0.0.1'
supports 'ubuntu', '= 12.04'

description 'Database helper cookbook'

recipe 'nmddatabase::default', 'Does nothing'

provides 'nmddatabase::useraccess'
recipe 'nmddatabase::useraccess', 'Gives specific users access to a database.'

depends 'chef-client', '= 3.2.2'
depends 'database', '= 2.1.8'
depends 'mysql', '= 4.0.14'
