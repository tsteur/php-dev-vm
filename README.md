PHP Development VM using Vagrant + Puppet
=========================================

Setups a Virtual Machine for PHP development. The Vagrant base box is Ubuntu Precise 64. I used it for example in Laravel and Symfony2 projects.

### Installation
 1. Install [Vagrant](http://www.vagrantup.com) & [VirtualBox](https://www.virtualbox.org)
 2. Clone this repository including all submodules (`git clone --recursive https://github.com/tsteur/php-dev-vm.git`)
 3. This step is optional. If you want any changes of the defaults, you can make changes in a local vagrant configuration. Have a look at `vagrantconfig.yaml` for a list of possible options.

 `cp vagrantconfig_local.yaml-dist vagrantconfig_local.yaml`
 4. Execute the command `vagrant up`
 5. That's it. It'll take some time when executing this command the first time. It'll download the Vagrant base box once and install all required packages.
 6. Don't forget to update your local hosts file. Default is `192.168.33.41 myproject.local`.

### Usage

Open "http://myproject.local" after installation. By default, all files are located within the "project" directory. It's a shared folder. You can edit all files without having to turn on the Virtual Machine. 

The mount point in your VM is `/home/vagrant/project`

### Available Options

 * db_password
 * db_username
 * db_name
 * db_root_password
 * project_url
 * project_dir
 * ipaddress

Default values are defined here: https://github.com/tsteur/php-dev-vm/blob/master/vagrantconfig.yaml

### Installed Packages
 * PHP including lots of modules
 * PHP QA Tools (PHPUnit, PHPMD - PHP Mess Detector, PHP Depend, PHP CodeCoverage, PHP_CodeSniffer, ...)
 * Apache2
 * MySQL
 * Redis
 * Memcache
 * Percona-Toolkit
 * Apache Utils
 * Graphviz
 * Subversion
 * Git
 * Composer


