# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  cookbook_name = "et_fog"

  config.vm.hostname = "#{cookbook_name.gsub('_','-')}-berkshelf"

  case ENV["VAGRANT_DEFAULT_PROVIDER"]
  when "aws"

    config.vm.box = "dummy"
    config.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

    config.vm.provider :aws do |aws, override|
      aws.access_key_id = "#{ENV['AWS_ACCESS_KEY']}"
      aws.secret_access_key = "#{ENV['AWS_SECRET_KEY']}"
      aws.keypair_name = "aws_dev"
      #aws.private_ip_address = "10.0.0.165"

      aws.ami = "ami-cf5e2ba6"

      aws.security_groups = ["sg-79ea5a16"]
      aws.subnet_id = "subnet-d97dcfb2"
      aws.tags = {
        "Name" => "stage-#{cookbook_name.gsub('_','-')}-#{config.vm.hostname}",
        "Role" => "#{cookbook_name} Testing",
        "Env" => "stage"
      }
      aws.elastic_ip = true

      override.ssh.username = "ubuntu"
      override.ssh.private_key_path = "#{ENV['HOME']}/.ssh/aws_dev.pem"
      #override.ssh.host = "10.0.0.165"
    end

    config.vm.provision :shell, :inline => "mkdir -p /etc/chef/ohai/hints && echo '{}' > /etc/chef/ohai/hints/ec2.json"

  else

    config.vm.provider :virtualbox

    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = "precise64"

    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    config.vm.box_url = "http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box"

  end

  config.vm.network :private_network, ip: "33.33.33.10"

  config.berkshelf.enabled = true

  config.vm.synced_folder "#{ENV['HOME']}/.chef", "/tmp/local-chef"

  config.vm.provision :shell, :inline => "curl -s -L https://www.opscode.com/chef/install.sh | sudo bash"

  if ENV['CHEF_REPO']
    chef_repo = ENV['CHEF_REPO']
  else
    raise "CHEF_REPO is not defined"
  end

  config.vm.provision :chef_solo do |chef|
    chef.json = {}

    chef.data_bags_path = "#{chef_repo}/data_bags"
    chef.encrypted_data_bag_secret_key_path = "#{ENV['HOME']}/.chef/encrypted_data_bag_secret"

    chef.run_list = [
        "recipe[et_base]",
        "recipe[et_fog::default]"
    ]
  end
end
