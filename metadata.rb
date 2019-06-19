name             'et_fog'
maintainer       'EverTrue, Inc.'
maintainer_email 'devops@evertrue.com'
license          'Apache v2.0'
description      'Installs/Configures the Fog ruby library'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '4.1.0'

source_url 'https://github.com/evertrue/et_fog-cookbook/' if respond_to?(:source_url)
issues_url 'https://github.com/evertrue/et_fog-cookbook/issues' if respond_to?(:issues_url)

supports 'ubuntu'

chef_version '>= 12.10'

depends 'build-essential', '>= 2.0'
