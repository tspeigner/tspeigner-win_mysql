# win_mysql

#### Table of Contents

* [Description](#description)
* [Setup](#setup)
   * [Beginning with win_mysql](#beginning-with-win_mysql)
* [Usage](#usage)
* [Reference](#reference)
* [Limitations](#limitations)
* [Development](#development)
* [Release Notes](#release-notes)

![Travis Status](https://travis-ci.org/tspeigner/tspeigner-win_mysql.svg?branch=master "Travis Status")

## Description

This module installs both MySQL Server and MySQL Client (Workbench).  We use [Chocolatey](https://forge.puppet.com/puppetlabs/chocolatey) for the installation of both packages, Puppet Labs [inifile](https://forge.puppet.com/puppetlabs/inifile) module to manage the my.ini settings, the [Reboot](https://forge.puppet.com/puppetlabs/reboot) module which is used for installing the required [vcredist2013](https://www.microsoft.com/en-us/download/details.aspx?id=40784) package required for the server to operate properly [reference](https://github.com/ferventcoder/chocolatey-packages/issues/253).  

## Beginning with win_mysql
```sh
include win_mysql
```

## Usage
You can use the individual classes separately

```sh
include win_mysql::server
include win_mysql::client
```

The server currently installs the package to 'c:\tools\mysql' but then uses the "Current" running version, which is located at 'c:\tools\mysql\current'.  

The win_mysql::server::config is where you can set additional configuration parameters, but I've included some base examples, which came from a couple of sources, which are referenced in the class. Make changes to config values in both the config.pp file and params.pp.  Soon enough the values will be put into hiera.

The win_mysql::client installs the MySQL Workbench software to its default path.

## Limitations

This module has been tested on Windows 2012 adn Windows 2016.  Currently, in 2016 the Chocolatey installation does not set the path to MySQL.  This will be added shortly.

## Development

Fork it, develop it, push it.  Or just give feedback, you won't hurt my feelings.

## Release Notes

0.1.0 is the first release and there will definitely be cleanup.  Looking to move the params to hiera.

0.1.1 fixes some linting errors adds OS support information and fixed unbounded ranges on dependencies.

0.1.2 added tags to metadata.

0.1.3 //TO ADD