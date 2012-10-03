# -*- mode: ruby -*-
# vi: set ft=ruby :

require "yaml"

_config = YAML.load(File.open(File.join(File.dirname(__FILE__), "vagrantconfig.yaml"), File::RDONLY).read)

begin
    _config.merge!(YAML.load(File.open(File.join(File.dirname(__FILE__), "vagrantconfig_local.yaml"), File::RDONLY).read))
rescue Errno::ENOENT

end

CONF = _config

MOUNT_POINT  = "/home/vagrant/" + CONF['project_dir'] 

Vagrant::Config.run do |config|

  config.vm.box     = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :hostonly, CONF['ipaddress']

  config.vm.share_folder CONF['project_dir'], MOUNT_POINT, CONF['project_dir']
  config.vm.share_folder "PuppetFiles", "/etc/puppet/files", "puppet/files"

  config.vm.provision :puppet, :options => ["--fileserverconfig=/vagrant/fileserver.conf"] do |puppet|
  
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "default.pp"
    puppet.module_path    = "puppet/manifests/modules"
    puppet.facter = [
            ['project_dir', MOUNT_POINT],
            ['project_url', CONF['project_url']],
            ['db_username', CONF['db_username']],
            ['db_password', CONF['db_password']],
            ['db_name', CONF['db_name']],
            ['db_root_password', CONF['db_root_password']],
    ]
  end

end
